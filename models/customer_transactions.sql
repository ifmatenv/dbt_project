WITH customer_data AS (
    SELECT
        customer_id,
        customer_full_name,
        email
    FROM {{ ref('stg_customers') }}
),
account_data AS (
    SELECT
        account_id,
        customer_id 
    FROM {{ ref('stg_accounts') }}
),
transaction_data AS (
    SELECT
        transaction_id,
        account_id,
        transaction_type,
        amount,
        transaction_date,
        Status
    FROM {{ ref('stg_transactions') }}
)

SELECT
    c.customer_id,
    c.customer_full_name,
    c.email,
    a.account_id,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    t.Status
FROM customer_data c
JOIN account_data a ON c.customer_id = a.customer_id
JOIN transaction_data t ON a.account_id = t.account_id