import pandas as pd

def running_total(scores: pd.DataFrame) -> pd.DataFrame:
    sorted_scores = scores.sort_values(by = ['gender', 'day'], ascending = [True, True])
    sorted_scores['total'] = sorted_scores.groupby('gender')['score_points'].cumsum()
    return sorted_scores[['gender', 'day', 'total']]