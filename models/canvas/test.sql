WITH c AS (
  SELECT
    *
  FROM {{ ref('dim_jaffle_customers') }}
), o AS (
  SELECT
    *
  FROM {{ ref('fct_jaffle_orders') }}
), rename_1 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS C_CUSTOMER_ID)
  FROM c
), rename_2 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS O_CUSTOMER_ID)
  FROM o
), join_1 AS (
  SELECT
    *
  FROM rename_1
  LEFT JOIN rename_2
    ON rename_1.C_CUSTOMER_ID = rename_2.O_CUSTOMER_ID
), order_1 AS (
  SELECT
    *
  FROM join_1
  ORDER BY
    LIFETIME_SPEND DESC
  LIMIT 1000
), rename_3 AS (
  SELECT
    C_CUSTOMER_ID AS CUSTOMER_ID,
    CUSTOMER_NAME,
    COUNT_LIFETIME_ORDERS,
    FIRST_ORDERED_AT,
    LAST_ORDERED_AT,
    LIFETIME_SPEND_PRETAX,
    LIFETIME_SPEND,
    CUSTOMER_TYPE,
    ORDER_ID,
    ORDER_TOTAL
  FROM order_1
), test_sql AS (
  SELECT
    *
  FROM rename_3
)
SELECT
  *
FROM test_sql