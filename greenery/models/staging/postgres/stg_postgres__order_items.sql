{{config(
    materialized = 'view'
    )
}}

with source as (
    select  
        order_id
    ,   product_id
    ,   quantity
    from {{source('postgres', 'order_items')}}
)

SELECT * FROM source