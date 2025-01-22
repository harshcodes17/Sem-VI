import pandas as pd
import numpy as np
from scipy.stats import norm
from sklearn.metrics import accuracy_score,confusion_matrix

def generate_Heights(n=1000, femalex=152, malex=166, sd=5):
    female_h = np.random.normal(femalex,sd,n)
    male_h = np.random.normal(malex,sd,n)
    df_fm = pd.DataFrame({'height': female_h, 'gender': ['F'] * n})
    df_m = pd.DataFrame({'height': male_h, 'gender': ['M'] * n})
    df = pd.concat([df_fm,df_m])
    return df

print(generate_Heights())
df = generate_Heights()
generate_Heights().to_csv('heights.csv', index=False)

def probability_based_on_likelihood(df,femalex = 152 , malex = 166 , sd = 5):
    female_prob = norm.pdf(df['height'], femalex, sd)
    male_prob = norm.pdf(df['height'], malex, sd)
    result = np.where(male_prob>female_prob, 'M', 'F')
    return result

result = probability_based_on_likelihood(df)
print(result)
df['predicted_gender'] = result

df.to_csv('pdf.csv', index=False)



def threshold_classifier(df, threshold=None):
    if threshold is None:
        threshold = (152 + 166) / 2
    result = np.where(df['height'] > threshold, 'M', 'F')
    return result

print(threshold_classifier(df))
result = threshold_classifier(df)
df['predicted_gender'] = result
df.to_csv('threshold.csv', index=False)

def quantized_classifier(df, interval=0.5):
    df['height_quantized'] = (df['height'] // interval) * interval
    majority_gender = df.groupby('height_quantized')['gender'].agg(
        lambda x: 'M' if (x == 'M').sum() > (x == 'F').sum() else 'F'
    )
    predictions = df['height_quantized'].map(majority_gender)
    return predictions

result = quantized_classifier(df)

df['predicted_gender'] = result
df.to_csv('quantized.csv',index = False)






