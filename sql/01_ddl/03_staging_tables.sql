-------------------------------------
--staging.customers table
-------------------------------------
CREATE TABLE staging.customers (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    country VARCHAR(50),
    segment VARCHAR(20)
);
-------------------------------------
--staging.accounts
-------------------------------------
CREATE TABLE staging.accounts (
    account_id INT,
    customer_id INT,
    account_type VARCHAR(20),
    currency VARCHAR(10),
    balance NUMERIC(15, 2)
);
-------------------------------------
--staging.transactions table
-------------------------------------
CREATE TABLE staging.transactions (
    transaction_id INT,
    account_id INT,
    transaction_type VARCHAR(20),
    amount NUMERIC(15, 2),
    transaction_date DATE,
    description TEXT
);
-------------------------------------
--staging.exposures table
-------------------------------------
CREATE TABLE staging.exposures (
    exposure_id INT,
    customer_id INT,
    account_id INT,
    exposure_type VARCHAR(20),
    exposure_amount NUMERIC(15, 2),
    interest_rate NUMERIC(5, 2),
    start_date DATE,
    maturity_date DATE,
    days_past_due INT,
    status VARCHAR(20),
    credit_score INT
);
-------------------------------------
--staging.payments table
-------------------------------------
CREATE TABLE staging.payments (
    payment_id INT,
    exposure_id INT,
    payment_date DATE,
    amount NUMERIC(15, 2),
    payment_status VARCHAR(20)
);