
{% set old_relation = ref('old_tpch_orders') -%}

{% set dbt_relation = ref('stg_tpch_orders') %}

{{ audit_helper.compare_all_columns(
    a_relation = old_relation,
    b_relation = dbt_relation,
    primary_key = "order_key"
) }}