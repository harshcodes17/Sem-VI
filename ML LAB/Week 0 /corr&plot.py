import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


df = pd.read_csv('/home/harsh/Desktop/Sem-VI/ML LAB/Week 0 /data.csv')

# print(df.corr())
df.corr()
# df.plot(kind='scatter', x='Duration', y='Pulse')
df["Duration"].plot(kind = 'hist')

plt.show()
