import pandas as pd
from snowflake.snowpark.functions import udf

def model(dbt, session):

    dbt.config(
        packages = ["pandas"],
    )

    session.sql('create or replace stage MODELSTAGE').collect()

    @udf(name="mod5", is_permanent=True, stage_location="@MODELSTAGE", replace=True)
    def mod5(x: int) -> int:
        return x % 5

    @udf(name="area_of_circle", is_permanent=True, stage_location="@MODELSTAGE", replace=True)
    def area_of_circle(r: float) -> float:
        pi = 3.14
        area = pi * (r * r)
        return area

    df = pd.read_json('{"function_name":"mod5","location":"MODELSTAGE"}\n{"function_name":"area_of_circle","location":"MODELSTAGE"}', lines=True)

    return df