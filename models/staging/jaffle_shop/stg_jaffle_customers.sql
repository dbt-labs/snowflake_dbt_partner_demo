<<<<<<< HEAD
with

source as (

    select * from {{ source('ecom', 'raw_customers') }}

),

renamed as (

    select

        ----------  ids
        id as customer_id,

        ---------- text
        name as customer_name

    from source

)

select * from renamed
=======
{{
    config(
        materialized='table',
    )
}}

select
    id as customer_id,
    first_name,
    last_name

from {{ source('jaffle_shop','customers')}}
>>>>>>> 9a2daf7f03719eae698d5977f8074f568df9d306
