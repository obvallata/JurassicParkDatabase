import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def select_scripts():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path).split(";")[:-1]


@pytest.fixture()
def select_dfs(select_scripts, sqlalchemy_conn):
    results_pd = list()
    for elem in select_scripts:
        results_pd.append(execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=elem
    ))
    return results_pd


def test(select_dfs):
    correct_answers = [2, 6, 5, 10, 13, 10]

    for i in range(6):
        assert select_dfs[i].shape[0] == correct_answers[i]

    assert select_dfs[0].columns.to_list() == ["entertainment_id", "planned_quantity"]

    assert select_dfs[1].columns.to_list() == ["req_age", "amount_entertainment"]

    assert select_dfs[2].columns.to_list() == ["habitat", "population"]

    assert select_dfs[3].columns.to_list() == ["section_id", "section_revenue", "park_revenue"]

    assert select_dfs[4].columns.to_list() == ["section_id", "employee_id", "salary", "salary_rank"]

    assert select_dfs[5].columns.to_list() == ["employee_id",
                                                     "highest_salary_profession",
                                                     "highest_salary",
                                                     "lowest_salary_profession",
                                                     "lowest_salary"]


