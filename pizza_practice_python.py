# imports Libraries
import pandas as pd
import matplotlib.pyplot as plt

# example data 
data = {
    'Pizza_Name': ['BBQ Chicken', 'Cheese', 'Truffle Special', 'Pepperoni'],
    'Price': [12.50, 8.99, 25.00, 14.50]
}

# create dataframe
df = pd.DataFrame(data)
print(df)

# create function to check premium and buget pizzas
def lable_pizza(price):
    if price > 15:
        return "Premium"
    else:
        return "Budget"
    
# apply' command function ko har row pe chalata hai
df['Category'] = df['Price'].apply(lable_pizza)    
print(df)

# create a group by category
revenue = df.groupby('Category')['Price'].sum()

print(revenue)



revenue_2 = df.groupby('Category')['Price'].count()
print(revenue_2)


# Graph using matplotlib

revenue.plot(kind='bar', color=['skyblue', 'orange'])

# Thoda sajate hain
plt.title("Budget vs Premium: Kaun Jeeta?")
plt.xlabel("Category")
plt.ylabel("Total Paisa ($)")
plt.show()  # Show the Chart
