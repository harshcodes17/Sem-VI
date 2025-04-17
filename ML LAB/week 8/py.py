import pandas as pd

# Load the uploaded CSV file
file_path = "/home/harshbamane/Desktop/Sem-VI/ML LAB/week 8/polynomial_regression.csv"
df = pd.read_csv(file_path)

# Show basic info and head of the dataset
df.info(), df.head()
