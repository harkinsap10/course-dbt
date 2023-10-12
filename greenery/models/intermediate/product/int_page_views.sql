
{{config(
    materialized = 'view'
    )
}}

SELECT 
         e.*
        ,p.name as product_name
        ,p.price as product_price
        ,p.inventory as product_inventory
        , sum(case when event_type = 'checkout' THEN 1 ELSE 0 END) as checkouts
        , sum(case when event_type = 'package_shipped' THEN 1 ELSE 0 END) as package_shipped
        , sum(case when event_type = 'add_to_cart' THEN 1 ELSE 0 END) as add_to_cart
        , sum(case when event_type = 'page_view' THEN 1 ELSE 0 END) as page_views
    FROM {{ ref('stg_postgres__events') }} e
    LEFT JOIN {{ ref('stg_postgres__products') }} p
    ON e.product_id = p.product_id
    GROUP BY ALL