WITH stg_jaffle_customers AS (
  SELECT
    *
  FROM {{ ref('stg_jaffle_customers') }}
), stg_jaffle_orders AS (
  SELECT
    *
  FROM {{ ref('stg_jaffle_orders') }}
), rename_1 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS C_CUSTOMER_ID)
  FROM stg_jaffle_customers
), rename_2 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS O_CUSTOMER_ID)
  FROM stg_jaffle_orders
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
    ORDERED_AT,
    ORDER_TOTAL,
    LOCATION_ID
  FROM order_1
), test3_sql AS (
  SELECT
    *
  FROM rename_3
)
SELECT
  *
FROM test3_sql