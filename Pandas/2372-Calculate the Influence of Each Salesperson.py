import pandas as pd

def calculate_influence(salesperson: pd.DataFrame, customer: pd.DataFrame, sales: pd.DataFrame) -> pd.DataFrame:
    alls = salesperson.merge(customer, on = "salesperson_id", how = "left")
    alls = alls.merge(sales, on = "customer_id", how = "left")
    alls = alls.groupby(['salesperson_id', 'name'])['price'].sum().reset_index(name = "total")
    return alls