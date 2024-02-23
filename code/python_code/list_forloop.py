import pandas as pd
import numpy as np

# import data
df_raw = pd.read_csv("data/raw/work.csv")

# have a look at first 10 rows
df_raw.head(10)

# create a list a variables for calculating there sum
tobe_loop = ["ind_prod_const", "ind_prod_const_sa", "usa_imp_sa"]

# Define function to calculate the sum of each variable
def SumVarbyYear(dataframe, looplist):
  df_sum = []
  for i in looplist: # for loop
    proc_sum = dataframe.groupby('year')[i].sum() # group by year and sum
    df_sum.append(proc_sum)

  df_sum = pd.concat(df_sum, axis = 1) # merge pd.series into one pd.dataframe
  df_sum.reset_index(inplace=True) # set year as first column
  return df_sum

df = SumVarbyYear(df_raw, tobe_loop) # use the function on targeted items
print(df)
