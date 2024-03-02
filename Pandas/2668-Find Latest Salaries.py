import pandas as pd

def find_latest_salaries(salary: pd.DataFrame) -> pd.DataFrame:
    high_salary = salary.groupby(['emp_id'])['salary'].max().reset_index(name = "salary")
    output = salary.merge(high_salary, on = ["emp_id", "salary"], how = "right")
    return output