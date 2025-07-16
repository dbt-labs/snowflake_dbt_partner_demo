{{
config(
pre_hook=
"{{create_or_replace_iceberg(var('fct_customers'))}}"
)
}}



select * from {{ ref('databricks_demo', 'fct_customers') }}