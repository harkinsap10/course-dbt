{{config(
    materialized = 'view'
    )
}}


SELECT 
 shipping_service
{{ product_name('int_orders_with_products','product_name') }}
FROM {{ ref('int_orders_with_products') }}
GROUP BY 1
