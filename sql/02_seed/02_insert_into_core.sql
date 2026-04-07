------------------------------
-- insert customers
------------------------------
INSERT INTO core.customers (
    customer_id,
    first_name,
    last_name,
    date_of_birth,
    country,
    segment
)
SELECT
    customer_id,
    first_name,
    last_name,
    date_of_birth,
    country,
    segment
FROM staging.customers;
------------------------------
-- insert accounts
------------------------------
INSERT INTO core.accounts (
    account_id,
    customer_id,
    account_type,
    currency,
    balance
)
SELECT
    account_id,
    customer_id,
    account_type,
    currency,
    balance
FROM staging.accounts;
------------------------------
-- insert transactions
------------------------------
INSERT INTO core.transactions (
    transaction_id,
    account_id,
    transaction_type,
    amount,
    transaction_date,
    description
)
SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    transaction_date,
    description
FROM staging.transactions;
------------------------------
-- insert exposure
------------------------------
INSERT INTO core.exposures (
    exposure_id,
    customer_id,
    account_id,
    exposure_type,
    exposure_amount,
    interest_rate,
    start_date,
    maturity_date,
    days_past_due,
    status,
    credit_score
)
SELECT
    exposure_id,
    customer_id,
    account_id,
    exposure_type,
    exposure_amount,
    interest_rate,
    start_date,
    maturity_date,
    days_past_due,
    status,
    credit_score
FROM staging.exposures;
------------------------------
-- insert payments
------------------------------
INSERT INTO core.payments (
    payment_id,
    exposure_id,
    payment_date,
    amount,
    payment_status
)
SELECT
    payment_id,
    exposure_id,
    payment_date,
    amount,
    payment_status
FROM staging.payments;