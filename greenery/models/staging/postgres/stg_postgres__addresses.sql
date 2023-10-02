{{config(
    materialized = 'view'
    , post_hook = 'grant select on table dev_db.harkinsapgmailcom.fct_orders_with_products to role reporting'
    )
}}

with source as (
    select  
        address_id
    ,   address as mailing_address
    ,   zipcode
    ,   state as mailing_state
    ,   country
    from {{source('postgres', 'addresses')}}
)

SELECT * FROM source