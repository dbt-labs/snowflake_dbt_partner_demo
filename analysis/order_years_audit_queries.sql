-- select
    -- min(order_date),
    -- max(order_date)
    -- -- *
-- from {{ ref('stg_tpch_orders') }}

-- select
--   distinct(year(order_date)) as order_year
-- from {{ ref('stg_tpch_orders') }}
-- order by order_year