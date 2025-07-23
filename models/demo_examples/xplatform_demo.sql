{{
config(
pre_hook= "{{create_or_replace_iceberg('fct_customers')}}"),

}}



select * from {{ ref('databricks_demo', ('fct_customers')) }}