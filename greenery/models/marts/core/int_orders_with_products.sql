{{config(
    materialized = 'view'
    )
}}


SELECT 
         o.*
        ,oi.quantity
        ,p.name as product_name
        ,p.price as product_price
        ,ps.discount as promo_discount
        ,ps.status as promo_status
   FROM {{ ref('stg_postgres__orders') }} o
   LEFT JOIN {{ ref('stg_postgres__order_items') }} oi
   ON o.order_id = oi.order_id
   LEFT JOIN {{ ref('stg_postgres__products') }} p
   ON oi.product_id = p.product_id
   LEFT JOIN {{ ref('stg_postgres__promos') }} ps
   on o.promo_id = ps.promo_id