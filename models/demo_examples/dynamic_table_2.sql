{{
    config(
        materialized = 'dynamic_table',
        warehouse = 'transforming',
        target_lag = target_lag_environment(),
        on_configuration_change = 'continue',
    )
}}


select * from {{ ref('dynamic_table') }}