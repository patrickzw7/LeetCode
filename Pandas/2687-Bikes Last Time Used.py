import pandas as pd

def last_used_time(bikes: pd.DataFrame) -> pd.DataFrame:
    bikes = bikes.groupby(['bike_number'])['end_time'].max().reset_index(name = "end_time")
    bikes = bikes.sort_values(by = ['end_time'], ascending = False)
    return bikes