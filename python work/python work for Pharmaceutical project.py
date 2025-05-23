

pip install pymysql sqlalchemy pandas

import pymysql
import pandas as pd

import matplotlib.pyplot as plt
import seaborn as sns


conn = pymysql.connect(
    host="localhost",        
    user="root",             
    password="Sandeep@1234", 
    database="pharma_sales_db"  
)

# Load each table
salesdaily_df = pd.read_sql("SELECT * FROM salesdaily", conn)
saleshourly_df = pd.read_sql("SELECT * FROM saleshourly", conn) 
salesmonthly_df = pd.read_sql("SELECT * FROM salesmonthly", conn)
salesweekly_df = pd.read_sql("SELECT * FROM salesweekly", conn)



salesdaily_df

saleshourly_df

salesmonthly_df

salesweekly_df


---------------------------------------------------------------------------------------------------------------




" Python Data Cleaning & EDA for Pharma Sales Data" 

Now that you’ve successfully imported all 4 datasets (salesdaily_df, saleshourly_df, salesmonthly_df, salesweekly_df), let’s proceed with data cleaning, processing, and EDA (Exploratory Data Analysis).


--1. Check Data Structure


print (salesdaily_df.info())

print (saleshourly_df.info())

print (salesmonthly_df . info())

print (salesweekly_df . info())


# Checks column names, missing values, and data types.

# Helps identify if any cleaning is needed (e.g., dates as strings).


---2. Fix Date Formats

# Convert 'Sale_Date' to datetime (if not already)
salesdaily_df['Sale_Date'] = pd.to_datetime(salesdaily_df['Sale_Date'])
saleshourly_df['Sale_Date'] = pd.to_datetime(saleshourly_df['Sale_Date'])
salesmonthly_df['Sale_Date'] = pd.to_datetime(salesmonthly_df['Sale_Date'])
salesweekly_df['Sale_Date'] = pd.to_datetime(salesweekly_df['Sale_Date'])


# Ensures dates are in the correct format for time-series analysis.

# Helps in filtering data by day/month/year later.


---3. Handle Missing Values


# Check for missing values
print(salesdaily_df.isnull().sum())
print(saleshourly_df.isnull().sum())
print(salesmonthly_df.isnull().sum())
print(salesweekly_df.isnull().sum())

# Fill missing values (if any) with 0 (assuming no sales = 0)
salesdaily_df.fillna(0, inplace=True)
saleshourly_df.fillna(0, inplace=True)
salesmonthly_df.fillna(0, inplace=True)
salesweekly_df.fillna(0, inplace=True)

# Missing values can distort analysis, so we replace them with 0 (assuming no sales).

# Ensures no gaps in data when calculating trends.


------------ : Exploratory Data Analysis (EDA)

(Finding trends, patterns, and insights from the data.)

4. Sales Trends Over Time

import matplotlib.pyplot as plt
import seaborn as sns

# Plot monthly sales trends for a drug category (e.g., Anti-Inflammatory)
salesmonthly_df.plot(x='Sale_Date', y='Anti_Inflam_Acetic', kind='line')
plt.title("Monthly Sales of Anti-Inflammatory Drugs")
plt.show()

# Shows how sales change over months/years.

# Helps identify seasonal patterns (e.g., higher sales in winter).



5. Top-Selling Drug Categories


# Sum sales by drug category
daily_totals = salesdaily_df.iloc[:, 1:9].sum().sort_values(ascending=False)
daily_totals.plot(kind='box', title="Total Sales by Drug Category")
plt.show()


# Reveals which drug categories sell the most.

# Helps pharmacies stock high-demand medicines.




6. Weekday vs. Weekend Sales


# Compare sales on weekdays vs weekends
salesdaily_df['Day_Type'] = salesdaily_df['Day_Name'].apply(
    lambda x: 'Weekend' if x in ['Saturday', 'Sunday'] else 'Weekday')

salesdaily_df.groupby('Day_Type')['Anxiolytics'].mean().plot(kind='bar')
plt.title("Average Anxiolytics Sales: Weekday vs Weekend")
plt.show()


# Checks if certain drugs sell more on weekends (e.g., painkillers).

# Helps in staffing and inventory planning.



7. Correlation Heatmap (Drug Categories Relationship)

import seaborn as sns
import matplotlib.pyplot as plt

# Select only drug columns (exclude dates, year, etc.)
drug_columns = ['Anti_Inflam_Acetic', 'Anti_Inflam_Propionic', 'Analgesic_Salicylic', 
                'Analgesic_Anilide', 'Anxiolytics', 'Sedatives', 'Respiratory_Drugs', 'Antihistamines']

# Calculate correlations
corr_matrix = salesdaily_df[drug_columns].corr()

# Advanced heatmap
plt.figure(figsize=(12, 8))
sns.heatmap(corr_matrix, 
            annot=True, 
            cmap='coolwarm', 
            vmin=-1, vmax=1,
            linewidths=0.5,
            annot_kws={"size": 10})
plt.title("Correlation Between Drug Categories (Daily Sales)", pad=20)
plt.xticks(rotation=45)
plt.yticks(rotation=0)
plt.tight_layout()
plt.show()


# Reveals if sales of certain drugs rise/fall together (e.g., painkillers & anti-inflammatories).

# Strong positive correlation (→1) = Often purchased together.








# Save each DataFrame to separate CSV files
salesdaily_df.to_csv('sales_daily.csv', index=False)
saleshourly_df.to_csv('sales_hourly.csv', index=False) 
salesmonthly_df.to_csv('sales_monthly.csv', index=False)
salesweekly_df.to_csv('sales_weekly.csv', index=False)

salesdaily_df

saleshourly_df

salesmonthly_df

salesweekly_df
















































































































































































































































































































































