 with

source as (

    select * from ACCOUNTS

),

renamed_balance as (

    select
        account_id,
        customer_id,
        balance as account_balance 

    from source

)

select * from renamed_balance
