import matplotlib.pyplot as plt

# Define the data for the pie chart
labels = ['Electronics', 'Fashion & Apparel', 'Books']
sizes = [45, 30, 25]  # percentages for each category
colors = ['lightblue', 'lightgreen', 'lightcoral']  # colors for each section
explode = (0.1, 0, 0)  # only "explode" the 1st slice (i.e., 'Electronics')

# Create the pie chart
plt.figure(figsize=(8, 6))
plt.pie(sizes, explode=explode, labels=labels, colors=colors, autopct='%1.1f%%', shadow=True, startangle=140)
plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

# Add a title
plt.title('Product Recommendations Distribution')

# Show the plot
plt.show()
