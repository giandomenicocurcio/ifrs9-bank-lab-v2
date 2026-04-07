------------------------------
--create the risk table
--IFRS9 result per reporting date
------------------------------
CREATE TABLE risk.ifrs9_exposure_snapshot (
    snapshot_date DATE,
    exposure_id INT,
    customer_id INT,
    account_id INT,
    exposure_type VARCHAR(20),
    exposure_amount NUMERIC(15,2),
    days_past_due INT,
    credit_score INT,
    stage INT,
    pd NUMERIC(8,6),
    lgd NUMERIC(8,6),
    ecl NUMERIC(15,2),
    PRIMARY KEY (snapshot_date, exposure_id)
);
