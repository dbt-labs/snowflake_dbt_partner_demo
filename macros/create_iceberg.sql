{% macro create_or_replace_iceberg(name) -%}
{%- set relation_implicit -%}
{{ env_var("DBT_MESH_SNOW_CATALOG_EXTERNAL_MANAGED") }}.{{
env_var("DBT_MESH_SNOW_SCHEMA_EXTERNAL_MANAGED") }}.{{ name }}
{%- endset -%}
CREATE OR REPLACE ICEBERG TABLE {{ relation_implicit }}
CATALOG_TABLE_NAME = {{ name }}
{%- endmacro %}