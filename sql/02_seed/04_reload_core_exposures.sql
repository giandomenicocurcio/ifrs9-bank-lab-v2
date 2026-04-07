TRUNCATE core.payments, core.exposures CASCADE;

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