With account_data_second AS (
    SELECT
        customer_id,
        account_balance
    FROM {{ ref('stg_accounts') }}
)

select * from account_data_second