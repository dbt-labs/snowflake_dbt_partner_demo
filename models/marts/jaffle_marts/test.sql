SELECT 
    customer_id,
    customer_name,
    count_lifetime_orders,
    first_ordered_at,
    last_ordered_at,
    lifetime_spend_pretax,
    lifetime_spend,
    customer_type
FROM {{ ref('dim_jaffle_customers') }}
ORDER BY lifetime_spend DESC
limit 10