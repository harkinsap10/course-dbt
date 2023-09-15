{{config(
    materialized = 'view'
    )
}}

with source as (
    select  
        promo_id
    ,   discount
    ,   status
    from {{source('postgres', 'promos')}}
)

SELECT * FROM source