
{% set old_query %}
    select * from {{ ref('old_tpch_orders') }}
{% endset %}

{% set new_query %}
    select * from {{ ref('stg_tpch_orders') }}
{% endset %}

{{ audit_helper.compare_column_values(
    a_query = old_query,
    b_query = new_query,
    primary_key = "order_key",
    column_to_compare = "total_price"
) }}
