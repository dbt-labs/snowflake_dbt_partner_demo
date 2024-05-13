{{
    config(
        materialized = 'dynamic_table',
        snowflake_warehouse = 'transforming',
        target_lag = target_lag_environment(),
        on_configuration_change = 'apply',
        enabled=false
    )
}}


select 

  orders.order_id,
  count(order_item_id) as total_items

from  {{ ref('stg_jaffle_orders') }} orders
inner join {{ ref('stg_jaffle_order_items') }} order_items on (order_items.order_id = orders.order_id)
group by 1