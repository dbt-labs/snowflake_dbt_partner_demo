{% macro generate_schema_name(custom_schema_name, node) %}
{% set default_schema = target.schema %}
{# non-specified schemas go to the default target schema #}
{% if custom_schema_name is none %}
{{ default_schema }}
5
{# specified custom schema names go to the schema name prepended with
the the default schema name in prod (as this is an example project we
want the schemas clearly labeled) #}
{% elif custom_schema_name ==
env_var('DBT_MESH_SNOW_SCHEMA_EXTERNAL_MANAGED') %}
{{ custom_schema_name }}
{%- else -%}
{{ default_schema }}_{{ custom_schema_name | trim }}
{%- endif -%}
{% endmacro %}