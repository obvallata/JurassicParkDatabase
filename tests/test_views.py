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
    correct_answers = [10, 8, 10, 10, 10, 10]

    for i in range(6):
        assert select_dfs[i].shape[0] == correct_answers[i]

    assert select_dfs[0].columns.to_list() == ["employee", "profession", "employee_contact"]

    assert select_dfs[1].columns.to_list() == ["employee", "profession", "workplace"]

    assert select_dfs[2].columns.to_list() == ["species_id", "section_name", "population"]

    assert select_dfs[3].columns.to_list() == ["individual_id", "species_id", "section_name", "habitat"]

    assert select_dfs[4].columns.to_list() == ["name", "contract_from", "contract_to", "employee_name", "amount_employees"]

    assert select_dfs[5].columns.to_list() == ["section_id", "name", "total_cost"]


