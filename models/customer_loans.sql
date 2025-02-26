WITH customer_data AS (
    SELECT
        customer_id,
        customer_full_name,
        email
    FROM {{ ref('stg_customers') }}
),
loan_data AS (
    SELECT
        loan_id,
        customer_id,
        loan_type,
        loan_amount,
        interest_rate,
        loan_date,
        due_date
    FROM {{ ref('stg_loans') }}
)
SELECT
    c.customer_id,
    c.customer_full_name,
    c.email,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_date,
    l.due_date
FROM customer_data c
JOIN loan_data l
ON c.customer_id = l.customer_id