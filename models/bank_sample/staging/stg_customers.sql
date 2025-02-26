 with

source as (

    select * from BANK_DEMO.PUBLIC.customers

),

customer_add_more_info as 
(
    select CONCAT(first_name,' ',last_name) as customer_full_name,email,
    customer_id from source

)

select * from customer_add_more_info