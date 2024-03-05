import pandas as pd

def find_expensive_cities(listings: pd.DataFrame) -> pd.DataFrame:
    mean_price = listings['price'].mean()
    city_means = listings.groupby(['city'])['price'].mean().reset_index(name = "avg_price")
    high_city_means = city_means[city_means['avg_price'] > mean_price]
    high_city_means = high_city_means[['city']].sort_values(by = ["city"], ascending = True)
    return high_city_means