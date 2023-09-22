{{config(
    materialized = 'view'
    )
}}

SELECT 
         *
    FROM {{ ref('int_page_views') }} 
