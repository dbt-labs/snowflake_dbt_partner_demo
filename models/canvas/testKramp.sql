WITH dim_jaffle_customers AS (
  SELECT
    *
  FROM {{ ref('dim_jaffle_customers') }}
), fct_jaffle_orders AS (
  SELECT
    *
  FROM {{ ref('fct_jaffle_orders') }}
), rename_1 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS C_CUSTOMER_ID)
  FROM dim_jaffle_customers
), rename_2 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS O_CUSTOMER_ID)
  FROM fct_jaffle_orders
), join_1 AS (
  SELECT
    *
  FROM rename_1
  JOIN rename_2
    ON rename_1.C_CUSTOMER_ID = rename_2.O_CUSTOMER_ID
), order_1 AS (
  SELECT
    *
  FROM join_1
  ORDER BY
    ORDERED_AT DESC
  LIMIT 10
), rename_3 AS (
  SELECT
    C_CUSTOMER_ID AS CUSTOMER_ID,
    CUSTOMER_NAME,
    ORDER_ID,
    ORDER_TOTAL,
    ORDERED_AT,
    IS_FOOD_ORDER
  FROM order_1
), testkramp_sql AS (
  SELECT
    *
  FROM rename_3
)
SELECT
  *
FROM testkramp_sql