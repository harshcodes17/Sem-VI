import pandas as pd 

data = pd.read_json('/home/harsh/Desktop/TY_CSE_22510112/ML LAB/Basics of Pandas/data.json')

print(data.to_string())

print(data.head())

print(data.info())  