from django.shortcuts import render
from django.contrib.auth.decorators import login_required
import pandas as pd
import psycopg
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

@login_required
def dashboard(request):
    # Image file names assumed to be stored in 'static/images/'
    # Context dictionary to pass to the template
    context = {
        'churn_rate_image': 'images/Churn_location.png',
        'monthly_sales_image': 'images/monthly_sales.png',
        'product_recommendation_image': 'images/product_recommendation_pie.png'
    }
    
    # Render and return the dashboard template with the context
    return render(request, 'dashboard.html', context)
@login_required
def view_table(request, table_name):
    try:
        # Connect to local PostgreSQL
        conn = psycopg.connect(
            "host=localhost dbname=ecommerce_data_lake user=postgres password='*******'"
        )

        # Query the selected table
        query = f"SELECT * FROM {table_name} LIMIT 50;"  # Fetch only 50 rows for performance
        data = pd.read_sql_query(query, conn)
        conn.close()

        # Convert data to HTML using Pandas (Optional)
        table_html = data.to_html(classes='table table-striped', index=False)

        # Prepare context data for rendering
        context = {
            'table_name': table_name,
            'table_data': table_html
        }
        
        # Render the template with the table data
        return render(request, 'view_table.html', context)

    except Exception as e:
        return render(request, 'error.html', {'message': str(e)})
