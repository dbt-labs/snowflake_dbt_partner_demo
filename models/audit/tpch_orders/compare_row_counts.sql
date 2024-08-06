
{% set old_relation = adapter.get_relation(
      database = "analytics",
      schema = "dbt_hwatson",
      identifier = "old_tpch_orders"
) -%}

{% set dbt_relation = ref('stg_tpch_orders') %}

{{ audit_helper.compare_row_counts(
    a_relation = old_relation,
    b_relation = dbt_relation
) }}
