-------------------------------------
--customers table
-------------------------------------
CREATE TABLE core.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-------------------------------------
--accounts table
-------------------------------------
CREATE TABLE core.accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES core.customers(customer_id),
    account_type VARCHAR(20),
    -- current, savings, credit
    currency VARCHAR(10),
    balance NUMERIC(15, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-------------------------------------
--transactions table
-------------------------------------
CREATE TABLE core.transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES core.accounts(account_id),
    transaction_type VARCHAR(20),
    -- deposit, withdrawal, transfer, card
    amount NUMERIC(15, 2),
    transaction_date DATE,
    description TEXT
);
-------------------------------------
--exposures table
-------------------------------------
CREATE TABLE core.exposures (
    exposure_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES core.customers(customer_id),
    account_id INT REFERENCES core.accounts(account_id),
    exposure_type VARCHAR(20),
    -- loan, mortgage, credit_card
    exposure_amount NUMERIC(15, 2),
    interest_rate NUMERIC(5, 2),
    start_date DATE,
    maturity_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-------------------------------------
--improving  exposure table
-------------------------------------
ALTER TABLE core.exposures
ADD COLUMN days_past_due INT DEFAULT 0,
    ADD COLUMN status VARCHAR(20),
    -- performing, delinquent, default
ADD COLUMN credit_score INT;
-------------------------------------
--improving  exposure table
-------------------------------------
CREATE TABLE core.payments (
    payment_id SERIAL PRIMARY KEY,
    exposure_id INT REFERENCES core.exposures(exposure_id),
    payment_date DATE,
    amount NUMERIC(15, 2),
    payment_status VARCHAR(20) -- paid, missed, late
);
-------------------------------------
--payments table
-------------------------------------
CREATE TABLE core.payments (
    payment_id SERIAL PRIMARY KEY,
    exposure_id INT REFERENCES core.exposures(exposure_id),
    payment_date DATE,
    amount NUMERIC(15, 2),
    payment_status VARCHAR(20) -- paid, missed, late
);
-------------------------------------
--segmentation
-------------------------------------
ALTER TABLE core.customers
ADD COLUMN segment VARCHAR(20);
-- retail, sme, corporate