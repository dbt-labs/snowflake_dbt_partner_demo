<<<<<<< HEAD
with

source as (

    select * from {{ source('ecom', 'raw_orders') }}

),

renamed as (

    select

        ----------  ids
        id as order_id,
        store_id as location_id,
        customer as customer_id,

        ---------- numerics
        (order_total / 100.0) as order_total,
        (tax_paid / 100.0) as tax_paid,

        ---------- timestamps
        {{dbt.date_trunc('day','ordered_at')}} as ordered_at

    from source

)

select * from renamed
=======
select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{ source('jaffle_shop','orders') }}
>>>>>>> 9a2daf7f03719eae698d5977f8074f568df9d306
