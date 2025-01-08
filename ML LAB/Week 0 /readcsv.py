import pandas as pd 


data =  pd.read_csv('/home/harsh/Desktop/TY_CSE_22510112/ML LAB/Basics of Pandas/data.csv')

print(data)
# Check the number of maximum returned rows
print(pd.options.display.max_rows) 
pd.options.display.max_rows = 9999
print(pd.options.display.max_rows)
