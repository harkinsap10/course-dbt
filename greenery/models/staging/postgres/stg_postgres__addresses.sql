{{config(
    materialized = 'view'
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