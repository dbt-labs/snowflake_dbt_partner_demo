{{
    config(
        materialized = 'dynamic_table',
        snowflake_warehouse = 'transforming',
        target_lag = target_lag_environment(),
        on_configuration_change = 'apply',
    )
}}


select 

  date_part('month', orders.order_date) as order_month,
  payments.payment_method,
  sum(payments.amount) as total_revenue

from  {{ ref('stg_stripe_payments') }} payments
inner join {{ ref('stg_jaffle_orders') }} orders on (payments.order_id = orders.order_id)
where orders.status = 'completed'
group by order_month, payment_method