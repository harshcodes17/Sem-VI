import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
from scipy.stats import zscore

# Step 1: Generate height data
np.random.seed(42)
male_heights = np.random.normal(166, 5.5, 1000)
female_heights = np.random.normal(152, 4.5, 1000)
labels_male = np.ones(1000)  # 1 for male
labels_female = np.zeros(1000)  # 0 for female

# Step 2: Train-Test Split
male_train, male_test, female_train, female_test = train_test_split(
    male_heights, female_heights, test_size=0.2, random_state=42
)

# Prepare train and test datasets
X_train = np.concatenate((male_train, female_train)).reshape(-1, 1)
y_train = np.concatenate((labels_male[:800], labels_female[:800]))
X_test = np.concatenate((male_test, female_test)).reshape(-1, 1)
y_test = np.concatenate((labels_male[800:], labels_female[800:]))

# Step 3: Train Naïve Bayes Classifier
classifier = GaussianNB()
classifier.fit(X_train, y_train)
y_train_pred = classifier.predict(X_train)
y_test_pred = classifier.predict(X_test)

# Initial Accuracy
train_acc = accuracy_score(y_train, y_train_pred)
test_acc = accuracy_score(y_test, y_test_pred)
print(f"Initial Train Accuracy: {train_acc:.4f}")
print(f"Initial Test Accuracy: {test_acc:.4f}")

# Step 4: Impact of Outliers
# Identify top 50 female heights and add 10 cm
indices = np.argsort(female_train)[-50:]
female_train[indices] += 10

# Observe change in mean and std
print("After Adding Outliers:")
print(f"Mean: {np.mean(female_train):.2f}, Std: {np.std(female_train):.2f}")

# Retrain classifier with outliers
X_train_outliers = np.concatenate((male_train, female_train)).reshape(-1, 1)
classifier.fit(X_train_outliers, y_train)
y_train_pred_outliers = classifier.predict(X_train_outliers)
y_test_pred_outliers = classifier.predict(X_test)

# Accuracy after adding outliers
train_acc_outliers = accuracy_score(y_train, y_train_pred_outliers)
test_acc_outliers = accuracy_score(y_test, y_test_pred_outliers)
print(f"Train Accuracy (with outliers): {train_acc_outliers:.4f}")
print(f"Test Accuracy (with outliers): {test_acc_outliers:.4f}")

# Step 5: Remove Outliers using Z-score
female_zscores = np.abs(zscore(female_train))
female_train_no_outliers = female_train[female_zscores < 3]

# Retrain classifier after outlier removal
X_train_no_outliers = np.concatenate((male_train, female_train_no_outliers)).reshape(-1, 1)
y_train_no_outliers = np.concatenate((labels_male[:800], np.zeros(len(female_train_no_outliers))))
classifier.fit(X_train_no_outliers, y_train_no_outliers)
y_train_pred_no_outliers = classifier.predict(X_train_no_outliers)
y_test_pred_no_outliers = classifier.predict(X_test)

# Accuracy after removing outliers
train_acc_no_outliers = accuracy_score(y_train_no_outliers, y_train_pred_no_outliers)
test_acc_no_outliers = accuracy_score(y_test, y_test_pred_no_outliers)
print(f"Train Accuracy (after outlier removal): {train_acc_no_outliers:.4f}")
print(f"Test Accuracy (after outlier removal): {test_acc_no_outliers:.4f}")

# Step 6: Impact of Trimming
for k in range(1, 16):
    lower_percentile = np.percentile(female_train, k)
    upper_percentile = np.percentile(female_train, 100 - k)
    female_trimmed = female_train[(female_train >= lower_percentile) & (female_train <= upper_percentile)]

    X_train_trimmed = np.concatenate((male_train, female_trimmed)).reshape(-1, 1)
    y_train_trimmed = np.concatenate((labels_male[:800], np.zeros(len(female_trimmed))))
    
    classifier.fit(X_train_trimmed, y_train_trimmed)
    y_train_pred_trimmed = classifier.predict(X_train_trimmed)
    y_test_pred_trimmed = classifier.predict(X_test)
    
    train_acc_trimmed = accuracy_score(y_train_trimmed, y_train_pred_trimmed)
    test_acc_trimmed = accuracy_score(y_test, y_test_pred_trimmed)
    
    print(f"Trimming {k}%: Train Acc = {train_acc_trimmed:.4f}, Test Acc = {test_acc_trimmed:.4f}")
