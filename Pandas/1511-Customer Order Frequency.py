import pandas as pd

def customer_order_frequency(customers: pd.DataFrame, product: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    all = product.merge(orders,on = "product_id", how = "left")

    all = all[(all['order_date'].dt.year == 2020) & ((all['order_date'].dt.month == 7) | (all['order_date'].dt.month == 6))]
    all['year'] = all['order_date'].dt.year
    all['month'] = all['order_date'].dt.month
    all['sales'] = all['quantity'] * all['price']
    all = all.groupby(['customer_id', 'year', 'month'])['sales'].sum().reset_index(name = "total")
    all = all[all['total'] >= 100]

    all = all.groupby(['customer_id']).size().reset_index(name = "cnt")
    all = all.merge(customers, on = "customer_id", how = "left")
    all = all[all['cnt'] >= 2][['customer_id', 'name']]

    return all