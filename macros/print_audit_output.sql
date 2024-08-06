{% macro print_audit_output() %}
{%- set columns_to_compare=adapter.get_columns_in_relation(ref('stg_tpch_orders'))  -%}

{% set old_etl_relation_query %}
    select * from {{ ref('old_tpch_orders') }}
{% endset %}

{% set new_etl_relation_query %}
    select * from {{ ref('stg_tpch_orders') }}
{% endset %}

{% if execute %}
    {% for column in columns_to_compare %}
        {{ log('Comparing column "' ~ column.name ~'"', info=True) }}
        {% set audit_query = audit_helper.compare_column_values(
                a_query=old_etl_relation_query,
                b_query=new_etl_relation_query,
                primary_key="order_key",
                column_to_compare=column.name
        ) %}

        {% set audit_results = run_query(audit_query) %}

        {% do log(audit_results.column_names, info=True) %}
            {% for row in audit_results.rows %}
                  {% do log(row.values(), info=True) %}
            {% endfor %}
    {% endfor %}
{% endif %}

{% endmacro %}