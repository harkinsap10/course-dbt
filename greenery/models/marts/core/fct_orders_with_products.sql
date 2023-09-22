{{config(
    materialized = 'view'
    )
}}


SELECT 
         *
   FROM {{ ref('int_orders_with_products') }} 