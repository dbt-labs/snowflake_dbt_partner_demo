{{
    config(
        materialized='incremental',
        catalog ='standard_catalog',
        base_location_root = 'test'

    )
}}


select * from {{ ref('dim_customers_v2') }}