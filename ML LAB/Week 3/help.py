import pandas as pd
import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as draw
import math as mt

# Tried changing the SD


def quantize(heights, interval_len):
    interval_label = np.floor(heights / interval_len)
    interval_counts = interval_label.value_counts()
    return interval_counts


def threshold_classifier(threshold_increment, f_heights, m_heights):
    total = 2000
    lower_bound_of_overlap = min(m_heights)
    # print("Hey there", lower_bound_of_overlap)
    upper_bound_of_overlap = max(f_heights)

    # print(lower_bound_of_overlap, upper_bound_of_overlap)

    new_lower_bound = mt.floor(lower_bound_of_overlap)
    new_upper_bound = mt.ceil(upper_bound_of_overlap)

    current_min_miss_classification_rate = 100.0
    current_optimal_threshold = new_lower_bound

    for threshold in np.arange(new_lower_bound, new_upper_bound + 1, threshold_increment):
        misclassified_females = sum(f_heights >= threshold)
        misclassified_males = sum(m_heights < threshold)

        misclassification_rate = 100.0 * (misclassified_females + misclassified_males) / total

        if misclassification_rate < current_min_miss_classification_rate:
            current_min_miss_classification_rate = misclassification_rate
            current_optimal_threshold = threshold
            # print("Minimum Changed here =>", current_optimal_threshold)

    return [current_optimal_threshold, current_min_miss_classification_rate]




def probability_classifier(f_heights, m_heights):
    total = 2000
    male_mean = m_heights.mean()
    male_sd = m_heights.std()
    female_mean = f_heights.mean()
    female_sd = f_heights.std()
    print(male_mean, male_sd, female_mean, female_sd)
    print(total)
    num_misclassified_females = 0
    for current_height in f_heights:
        female_probability = norm.pdf(current_height, female_mean, female_sd)
        male_probability = norm.pdf(current_height, male_mean, male_sd)
        if male_probability > female_probability:
            # print("Misclassified Female => ", current_height,
                #   female_probability, male_probability)
            num_misclassified_females += 1
    # print("Total Female Misclassification =>", num_misclassified_females)

    num_misclassified_males = 0
    for current_height in m_heights:
        female_probability = norm.pdf(current_height, female_mean, female_sd)
        male_probability = norm.pdf(current_height, male_mean, male_sd)
        if male_probability < female_probability:
            print("Misclassified Male =>", current_height,
                  female_probability, male_probability)
            num_misclassified_males += 1

    print("Total Male Misclassification =>", num_misclassified_males)

    misclassification_rate = 100.0 * \
        (num_misclassified_females + num_misclassified_males) / total
    return misclassification_rate





def local_classifier(interval_len, f_heights, m_heights):

    male_quantized = quantize(m_heights, interval_len)
    female_quantized = quantize(f_heights, interval_len)

    quantized_overlap_lower_bound = int(min(female_quantized.index))
    quantized_overlap_upper_bound = int(max(female_quantized.index))

    total_m = 0

    for common_interval in range(quantized_overlap_lower_bound, quantized_overlap_upper_bound + 1):
        female_count = 0 if common_interval not in female_quantized.index else female_quantized[
            common_interval]
        male_count = 0 if common_interval not in male_quantized.index else male_quantized[
            common_interval]

        error = min(female_count, male_count)
        total_m += error

        print(common_interval, female_count, male_count, error, total_m)

    return 100.0 * total_m / total


# Treid changing the interval length
# local_error = local_classifier(10, f_heights, m_heights)
if __name__ == '__main__':
    f_heights = pd.Series(np.random.normal(152, 5, 1000))
    m_heights = pd.Series(np.random.normal(166, 5, 1000))


    total = 2000  # male_count + female_count = 2000

    draw.hist([f_heights, m_heights], bins=93, label=['female', 'male'])
    draw.legend(loc='upper right')
    draw.show()
    probability_misclassification = probability_classifier(f_heights, m_heights)

    heights = f_heights
    ans = [0.001,0.01,0.05,0.1,0.2,0.5,1,2,5,10]
    for i in ans:
        threshold_results = threshold_classifier(i, f_heights, m_heights)
        print(threshold_results)
