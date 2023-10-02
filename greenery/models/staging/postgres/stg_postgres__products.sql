{{config(
    materialized = 'view'
    )
}}

with source as (
    select  
        product_id
    ,   regexp_replace(name, '[^A-Za-z0-9_]', '_', 1, 0, 'c') as name
    ,   price
    ,   inventory
    from {{source('postgres', 'products')}}
)

SELECT * FROM source