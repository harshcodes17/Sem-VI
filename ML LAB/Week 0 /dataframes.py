import pandas as pd


data = {
    "calories" : [420,430,322],
    "duration" : [50,40,45]
}

df = pd.DataFrame(data)

print(df)

#locating row
print(df.loc[0])

# df[0][0]
print(df.loc[0][0])

#use a list of indexes:
print(df.loc[[0, 1]])

print(df.head()) #returns the headers and the first 10 rows of a DataFrame.