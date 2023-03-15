import numpy as np
import pandas as pd
import phonenumbers as pn

def is_valid_jp_phone(phone_number):

    parsed_number = pn.parse(phone_number, "JP")

    return pn.is_valid_number(parsed_number)


def model(dbt, session):
    # dbt configuration
    dbt.config(packages=["pandas","numpy", "phonenumbers"])

    # get upstream data
    all_customers = dbt.ref("dim_customers").to_pandas()

    # filtering data
    japan_customers = all_customers[(all_customers["NATION"]=="JAPAN") & (all_customers["ACCOUNT_BALANCE"]>=1000)]

    # check phone numbers are valid using python phonenumber library 
    japan_customers["IS_VALID_PHONE"] = japan_customers["PHONE_NUMBER"].apply(is_valid_jp_phone)

    return japan_customers

