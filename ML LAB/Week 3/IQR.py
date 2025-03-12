import numpy as np
import matplotlib.pyplot as draw
import seaborn as sns
from scipy.stats import  zscore, median_abs_deviation
from help import probability_classifier, threshold_classifier


samples_cnt = 1000
female_mean = 152
male_mean = 166
stddv = 5

def samples(mean, sd, size):
    return np.random.normal(loc=mean, scale=sd, size=size)

males = samples(male_mean, stddv, samples_cnt)
females = samples(female_mean, stddv, samples_cnt)

sorted_females = np.sort(females)
sorted_females[-50:] += 10

mean_before, std_before = np.mean(females), np.std(females)
mean_after, std_after = np.mean(sorted_females), np.std(sorted_females)

print("Before Mean and Standard Deviation", mean_before, std_before)
print("After Mean and Standard Deviation", mean_after, std_after)


print(probability_classifier(males, sorted_females))
ans = [0.001,0.01,0.05,0.1,0.2,0.5,1,2,5,10]
for i in ans:
    threshold_results = threshold_classifier(i, males, sorted_females)
    print(threshold_results)



draw.figure(figsize=(12, 9))
draw.hist(sorted_females, bins=30, alpha=0.5,edgecolor='black', label='Female Heights', color='blue', )
draw.hist(males, bins=30, alpha=0.5,edgecolor='black', label='Male Heights', color='red')
draw.xlabel('Height (cm)')
draw.ylabel('Frequency')
draw.legend()
draw.title('Histogram of Heights')
draw.show()

draw.figure(figsize=(12, 9))
sns.boxplot(data=[sorted_females, males], palette=['blue', 'red'])
draw.xticks([0, 1], ['Female', 'Male'])
draw.ylabel('Height (cm)')
draw.title('Box and Whisker Plot of Heights')
draw.show()

z_scores = zscore(sorted_females)
outliers1 = sorted_females[np.abs(z_scores) > 2]
outliers2 = sorted_females[np.abs(z_scores) > 3]

print("Outlier at 2 :",len(outliers1))
print("Outlier at 3 :",len(outliers2))

Q1, Q3 = np.percentile(sorted_females, [25, 75])
IQR = Q3 - Q1
left_limit = Q1 - 1.5 * IQR
right_limit = Q3 + 1.5 * IQR
outliers_iqr = sorted_females[(sorted_females < left_limit) | (sorted_females > right_limit)]
print(f"IQR Outliers: {len(outliers_iqr)}")

mad_value = median_abs_deviation(sorted_females)

outliers_mad1_5 = sorted_females[np.abs(sorted_females - np.median(sorted_females)) > 1.5 * mad_value]
print(f"MAD Outliers (cutoff=1.5): {len(outliers_mad1_5)}")

outliers_mad2 = sorted_females[np.abs(sorted_females - np.median(sorted_females)) > 2 * mad_value]
print(f"MAD Outliers (cutoff=2): {len(outliers_mad2)}")

outliers_mad3 = sorted_females[np.abs(sorted_females - np.median(sorted_females)) > 3 * mad_value]
print(f"MAD Outliers (cutoff=3): {len(outliers_mad3)}")

def remove_outliers(data, method='zscore', threshold=3):
    if method == 'zscore':
        z_scores = zscore(data)
        return data[np.abs(z_scores) <= threshold]
    elif method == 'iqr':
        Q1, Q3 = np.percentile(data, [25, 75])
        IQR = Q3 - Q1
        left_limit = Q1 - 1.5 * IQR
        right_limit = Q3 + 1.5 * IQR
        return data[(data >= left_limit) & (data <= right_limit)]
    elif method == 'mad':
        mad_value = median_abs_deviation(data)
        return data[np.abs(data - np.median(data)) <= threshold * mad_value]
    else:
        print("Error")



cleaned_female_heights = remove_outliers(sorted_females, method='zscore', threshold=3)

print(probability_classifier(males, cleaned_female_heights))
ans = [0.001,0.01,0.05,0.1,0.2,0.5,1,2,5,10]
for i in ans:
    threshold_results = threshold_classifier(i, males, cleaned_female_heights)
    print(threshold_results)


draw.figure(figsize=(8, 6))
sns.boxplot(data=[cleaned_female_heights, males], palette=['blue', 'red'])
draw.xticks([0, 1], ['Female (Outliers Removed)', 'Male'])
draw.ylabel('Height (cm)')
draw.title('Box and Whisker Plot of Heights After Outlier Removal')
draw.show()

def trim_data(data, k):
    lower_percentile = np.percentile(data, k)
    upper_percentile = np.percentile(data, 100 - k)
    return data[(data >= lower_percentile) & (data <= upper_percentile)]
k_values = range(1, 16)

for k in k_values:
    trimmed_female_heights = trim_data(sorted_females, k)
    print(f"Probablity classification for {k}")
    p = probability_classifier(trimmed_female_heights,males)
    print(f"Threshold classification for {k}")
    q = threshold_classifier(k, trimmed_female_heights, males)
    print(p)
    print(q)

