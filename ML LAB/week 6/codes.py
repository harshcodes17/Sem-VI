import pandas as pd
import numpy as np
import statsmodels.api as sm
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score

df = pd.read_csv("linear_regression_3.csv")

target_column = "y"
X = df.drop(columns=[target_column])
y = df[target_column]

X_with_const = sm.add_constant(X)

model_ols = sm.OLS(y, X_with_const).fit()
influence = model_ols.get_influence()
cooks_d = influence.cooks_distance[0]

threshold = 4 / len(X)
outlier_mask = cooks_d < threshold

X_clean = X[outlier_mask]
y_clean = y[outlier_mask]

scaler = StandardScaler()
X_clean_scaled = scaler.fit_transform(X_clean)

X_train, X_test, y_train, y_test = train_test_split(X_clean_scaled, y_clean, test_size=0.2, random_state=42)

model = LinearRegression()
model.fit(X_train, y_train)

y_pred_train = model.predict(X_train)
y_pred_test = model.predict(X_test)

r2_train = r2_score(y_train, y_pred_train)
r2_test = r2_score(y_test, y_pred_test)

print(f"R² Score on Training Set: {r2_train:.4f}")
print(f"R² Score on Test Set: {r2_test:.4f}")
print(f"Number of Outliers Removed: {len(X) - len(X_clean)}")
