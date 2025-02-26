WITH customer_data AS (
    SELECT
        customer_id,
        customer_full_name
    FROM {{ ref('stg_customers') }}
),
credit_limit_data AS (
    SELECT
        customer_id,
        credit_limit
    FROM {{ ref('stg_credit_card_limit') }}
)

SELECT
    c.customer_id,
    c.customer_full_name,
    cl.credit_limit
FROM customer_data c
JOIN credit_limit_data cl
ON c.customer_id = cl.customer_id
