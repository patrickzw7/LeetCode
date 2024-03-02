import pandas as pd

def find_valid_users(purchases: pd.DataFrame) -> pd.DataFrame:
    purchases = purchases.sort_values(by = ['user_id', 'purchase_date'], ascending = True)[['user_id', 'purchase_date']]
    
    purchases['next_purchase_date'] = purchases.groupby('user_id')['purchase_date'].shift(periods = -1)
    valids = purchases[purchases['next_purchase_date'] - purchases['purchase_date'] <= timedelta(days=7)][['user_id']]
    valids = valids.drop_duplicates()#.sort_values(by = "user_id", ascending = True)
    return valids