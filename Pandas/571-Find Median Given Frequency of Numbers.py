import pandas as pd
import numpy as np

def median_frequency(numbers: pd.DataFrame) -> pd.DataFrame:
    li = []

    for i in range(len(numbers)):
        li += [numbers.iloc[i, 0]] * numbers.iloc[i, 1]
    
    me = np.median(li)

    df = pd.DataFrame([[me]], columns = ['median'])
    return df
    