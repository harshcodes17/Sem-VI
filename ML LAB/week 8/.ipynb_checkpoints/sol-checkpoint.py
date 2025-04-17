import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
import seaborn as sns
import matplotlib.pyplot as plt

# Step 3: Split the data into 80% train and 20% test
X = df[['x']].values
y = df['y'].values
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Step 4: Generate 30 samples of size 20 from training data
np.random.seed(42)
samples = [np.random.choice(len(X_train), size=20, replace=False) for _ in range(30)]

# Initialize lists to store errors
test_errors_by_degree = {deg: [] for deg in range(1, 11)}
train_minus_test_errors = {deg: [] for deg in range(1, 11)}

# For each sample and each degree, fit model and record errors
for sample_indices in samples:
    X_sample = X_train[sample_indices]
    y_sample = y_train[sample_indices]
    
    for deg in range(1, 11):
        poly = PolynomialFeatures(degree=deg)
        X_poly_sample = poly.fit_transform(X_sample)
        X_poly_test = poly.transform(X_test)
        X_poly_train = poly.transform(X_sample)

        model = LinearRegression()
        model.fit(X_poly_sample, y_sample)

        y_train_pred = model.predict(X_poly_train)
        y_test_pred = model.predict(X_poly_test)

        train_error = mean_squared_error(y_sample, y_train_pred)
        test_error = mean_squared_error(y_test, y_test_pred)

        test_errors_by_degree[deg].append(test_error)
        train_minus_test_errors[deg].append(train_error - test_error)

# Prepare data for violin plots
test_error_df = pd.DataFrame({
    "Degree": np.repeat(range(1, 11), len(samples)),
    "Test Error": [err for deg in range(1, 11) for err in test_errors_by_degree[deg]]
})

error_diff_df = pd.DataFrame({
    "Degree": np.repeat(range(1, 11), len(samples)),
    "Train - Test Error": [err for deg in range(1, 11) for err in train_minus_test_errors[deg]]
})

# Create violin plots
plt.figure(figsize=(14, 6))

plt.subplot(1, 2, 1)
sns.violinplot(x="Degree", y="Test Error", data=test_error_df, palette="coolwarm")
plt.title("Test Error vs Degree")

plt.subplot(1, 2, 2)
sns.violinplot(x="Degree", y="Train - Test Error", data=error_diff_df, palette="viridis")
plt.title("Train - Test Error vs Degree")

plt.tight_layout()
plt.show()
