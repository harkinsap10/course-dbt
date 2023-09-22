
{{config(
    materialized = 'view'
    )
}}

SELECT 
         e.*
        ,p.name as product_name
        ,p.price as product_price
        ,p.inventory as product_inventory
    FROM {{ ref('stg_postgres__events') }} e
    LEFT JOIN {{ ref('stg_postgres__products') }} p
    ON e.product_id = p.product_id