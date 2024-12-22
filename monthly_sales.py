import pandas as pd
import matplotlib.pyplot as plt

# Load the data from a CSV file
df = pd.read_csv('sales_data.csv')

# Ensure the order_date column is in datetime format
df['order_date'] = pd.to_datetime(df['order_date'])

# Extract year and month from the order_date and create a new column for it
df['year_month'] = df['order_date'].dt.to_period('M')

# Group by the new year_month column and sum up the sales
monthly_sales = df.groupby('year_month')['sales'].sum()

# Plotting the bar chart
plt.figure(figsize=(12, 8))  # Adjust the figure size to better fit your data
monthly_sales.plot(kind='bar', color='blue')  # You can change the color if you like

# Convert period index to datetime to use for x-axis labels
monthly_sales.index = monthly_sales.index.to_timestamp()

# Format the x-axis labels to show month names
plt.gca().set_xticklabels([x.strftime('%b-%Y') for x in monthly_sales.index])

plt.title('Monthly Sales')
plt.xlabel('Month')
plt.ylabel('Total Sales')
plt.xticks(rotation=45)  # Rotates the month labels for better readability
plt.tight_layout()  # Adjusts subplots to give some padding and prevent overlap
plt.show()
