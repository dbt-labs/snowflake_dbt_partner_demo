WITH c AS (
  SELECT
    *
  FROM {{ ref('dim_jaffle_customers') }}
), o AS (
  SELECT
    *
  FROM {{ ref('fct_jaffle_orders') }}
), oi AS (
  SELECT
    *
  FROM {{ ref('jaffle_order_items') }}
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
), rename_4 AS (
  SELECT
    ORDER_ID AS OID_ORDER_ID,
    PRODUCT_ID,
    PRODUCT_PRICE,
    SUPPLY_COST,
    IS_FOOD_ITEM,
    IS_DRINK_ITEM
  FROM oi
), join_1 AS (
  SELECT
    *
  FROM rename_1
  LEFT JOIN rename_2
    ON rename_1.C_CUSTOMER_ID = rename_2.O_CUSTOMER_ID
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
    ORDER_ID AS CO_ORDER_ID,
    ORDER_TOTAL,
    ORDERED_AT,
    IS_FOOD_ORDER,
    IS_DRINK_ORDER,
    ORDER_COST
  FROM join_1
), join_2 AS (
  SELECT
    *
  FROM rename_3
  LEFT JOIN rename_4
    ON rename_3.CO_ORDER_ID = rename_4.OID_ORDER_ID
), rename_5 AS (
  SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    COUNT_LIFETIME_ORDERS,
    FIRST_ORDERED_AT,
    LAST_ORDERED_AT,
    LIFETIME_SPEND_PRETAX,
    LIFETIME_SPEND,
    CUSTOMER_TYPE,
    CO_ORDER_ID AS ORDER_ID,
    ORDER_TOTAL,
    ORDERED_AT,
    IS_FOOD_ORDER,
    IS_DRINK_ORDER,
    ORDER_COST,
    PRODUCT_ID,
    PRODUCT_PRICE,
    SUPPLY_COST,
    IS_FOOD_ITEM,
    IS_DRINK_ITEM
  FROM join_2
), test AS (
  SELECT
    *
  FROM rename_5
)
SELECT
  *
FROM test