import pandas as pd

def most_frequently_products(customers: pd.DataFrame, orders: pd.DataFrame, products: pd.DataFrame) -> pd.DataFrame:
    order_counts = orders.groupby(['customer_id', 'product_id'])[['customer_id', 'product_id']].value_counts().reset_index(name = "buy_times")
    max_order_counts = order_counts.groupby(['customer_id'])['buy_times'].max().reset_index(name = "max_buy_times")
    max_orders = order_counts.merge(max_order_counts, 
                                    left_on = ['customer_id', 'buy_times'], 
                                    right_on = ['customer_id', 'max_buy_times'],
                                    how = "inner")[['customer_id', 'product_id']]
    max_orders = max_orders.merge(products, on = "product_id")[['customer_id', 'product_id', 'product_name']]
    return max_orders