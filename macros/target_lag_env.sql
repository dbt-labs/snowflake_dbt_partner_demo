{% macro target_lag_environment() %}

    {% set lag = '1 minute' if target.name == "prod" else '35 days' %}
    {{ return(lag) }}

{% endmacro %}