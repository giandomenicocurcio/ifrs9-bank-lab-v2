DELETE FROM risk.ifrs9_exposure_snapshot
WHERE snapshot_date = DATE '2026-04-30';

------------------------------
--calculation 2026_04_30
------------------------------
INSERT INTO risk.ifrs9_exposure_snapshot (
    snapshot_date,
    exposure_id,
    customer_id,
    account_id,
    exposure_type,
    exposure_amount,
    days_past_due,
    credit_score,
    stage,
    pd,
    lgd,
    ecl
)
SELECT
    DATE '2026-04-30' AS snapshot_date,
    e.exposure_id,
    e.customer_id,
    e.account_id,
    e.exposure_type,
    e.exposure_amount,
    e.days_past_due,
    e.credit_score,

    CASE
        WHEN e.days_past_due >= 90 THEN 3
        WHEN e.days_past_due >= 30 THEN 2
        ELSE 1
    END AS stage,

    CASE
        WHEN e.days_past_due >= 90 THEN 0.40
        WHEN e.days_past_due >= 30 THEN 0.15
        ELSE 0.02
    END AS pd,

    CASE
        WHEN e.exposure_type = 'credit_card' THEN 0.75
        ELSE 0.45
    END AS lgd,

    ROUND(
        e.exposure_amount *
        CASE
            WHEN e.days_past_due >= 90 THEN 0.40
            WHEN e.days_past_due >= 30 THEN 0.15
            ELSE 0.02
        END *
        CASE
            WHEN e.exposure_type = 'credit_card' THEN 0.75
            ELSE 0.45
        END
    , 2) AS ecl

FROM core.exposures e;