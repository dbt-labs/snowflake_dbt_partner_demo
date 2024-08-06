{{ 
  audit_helper.compare_all_columns(
    a_relation=ref('stg_tpch_orders'), 
    b_relation=ref('old_tpch_orders'), 
    exclude_columns=['comment'], 
    primary_key='order_key'
  ) 
}}