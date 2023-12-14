-- Ref: https://docs.getdbt.com/docs/collaborate/govern/model-versions#optimizing-model-versions
{% set dim_customers_v1 = ref('dim_tpch_customers', v=1) %}

select
{{ dbt_utils.star(from=dim_customers_v1, except=["nation_key"]) }}
from {{ dim_customers_v1 }}