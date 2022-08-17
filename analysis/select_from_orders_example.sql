select order_key, 
       order_date, 
       {{ standard_account_fields() }} 
from {{ ref('fct_orders') }}