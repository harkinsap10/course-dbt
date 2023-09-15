{{config(
    materialized = 'view'
    )
}}

with source as (
    select  
        product_id
    ,   name
    ,   price
    ,   inventory
    from {{source('postgres', 'products')}}
)

SELECT * FROM source