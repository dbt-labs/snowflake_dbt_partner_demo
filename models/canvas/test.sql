WITH dim_jaffle_customers AS (
  SELECT
    *
  FROM {{ ref('dim_jaffle_customers') }}
), fct_jaffle_orders AS (
  SELECT
    *
  FROM {{ ref('fct_jaffle_orders') }}
), order_1 AS (
  SELECT
    *
  FROM dim_jaffle_customers
  ORDER BY
    LIFETIME_SPEND DESC
  LIMIT 1000
), rename_2 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS ORDERS_CUSTOMER_ID)
  FROM fct_jaffle_orders
), rename_1 AS (
  SELECT
    CUSTOMER_ID AS OUTPUT_1_CUSTOMER_ID,
    CUSTOMER_NAME,
    COUNT_LIFETIME_ORDERS,
    FIRST_ORDERED_AT,
    LAST_ORDERED_AT,
    LIFETIME_SPEND_PRETAX,
    LIFETIME_SPEND,
    CUSTOMER_TYPE
  FROM order_1
), join_1 AS (
  SELECT
    *
  FROM rename_1
  JOIN rename_2
    ON rename_1.OUTPUT_1_CUSTOMER_ID = rename_2.ORDERS_CUSTOMER_ID
), rename_3 AS (
  SELECT
    OUTPUT_1_CUSTOMER_ID AS CUSTOMER_ID,
    CUSTOMER_NAME,
    COUNT_LIFETIME_ORDERS,
    FIRST_ORDERED_AT,
    LAST_ORDERED_AT,
    LIFETIME_SPEND_PRETAX,
    LIFETIME_SPEND,
    CUSTOMER_TYPE,
    ORDER_ID,
    LOCATION_ID,
    ORDER_TOTAL,
    TAX_PAID,
    ORDERED_AT,
    IS_FOOD_ORDER,
    IS_DRINK_ORDER,
    ORDER_COST
  FROM join_1
), test_sql AS (
  SELECT
    *
  FROM rename_3
)
SELECT
  *
FROM test_sql