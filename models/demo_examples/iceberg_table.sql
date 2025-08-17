{{
    config(
        materialized='table',
        catalog_name ='standard_catalog',
        base_location_root = 'test'

    )
}}


select 1 as foo