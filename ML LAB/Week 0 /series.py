import pandas as pd


array = [1, 2, 3, 4, 5]

numbers = pd.Series(array)
numbers = pd.Series(array,index=['first num', 'second num', 'third num', 'fourth num', 'fifth num'])
print(numbers)
print("first element:")
print(numbers[0])

calories = {"day1": 420, "day2": 380, "day3": 390}

fittrack = pd.Series(calories)
print(fittrack)