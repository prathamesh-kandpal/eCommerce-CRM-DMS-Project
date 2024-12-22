import pandas as pd
import matplotlib.pyplot as plt

# Assuming 'df' is your DataFrame containing the churn data
# If you haven't already loaded your data, here's how you could do it:
df = pd.read_csv('churn_data.csv')

# Group by location and calculate the number of churns in each location
churn_count = df[df['churn'] == 1].groupby('location')['churn'].count()

# Sort the churn counts for better visibility
churn_count_sorted = churn_count.sort_values(ascending=False)

# Plotting the bar chart
plt.figure(figsize=(12, 8))  # Adjust the figure size to better fit your data
churn_count_sorted.plot(kind='bar', color='skyblue')  # Sorted data for a more orderly look
plt.title('Churn by Location')
plt.xlabel('Location')
plt.ylabel('Number of Churns')
plt.xticks(rotation=45)  # Rotates the location labels for better readability
plt.grid(True, linestyle='--', alpha=0.6)  # Adds a grid for easier analysis
plt.tight_layout()  # Adjusts subplots to give some padding and prevent overlap
plt.show()
