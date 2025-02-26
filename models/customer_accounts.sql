WITH customer_data AS (
    SELECT
        customer_id,
        customer_full_name
    FROM {{ ref('stg_customers') }}
),
account_data AS (
    SELECT
        customer_id,
        account_balance
    FROM {{ ref('stg_accounts_second') }}
)

SELECT
    c.customer_id,
    c.customer_full_name,
    a.account_balance
FROM customer_data c
JOIN account_data a
ON c.customer_id = a.customer_id