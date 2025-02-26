 with

credit_limit_from_source as (

    select credit_limit,customer_id from BANK_DEMO.PUBLIC.CREDIT_CARDS

)

select * from credit_limit_from_source