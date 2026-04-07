------------------------------
--create finance table '2026-03-31'
------------------------------
CREATE TABLE IF NOT EXISTS finance.impairment_report (
    snapshot_date DATE,
    stage INT,
    total_exposure NUMERIC(15,2),
    total_ecl NUMERIC(15,2),
    PRIMARY KEY (snapshot_date, stage)
);
------------------------------
--insert aggregation
------------------------------
INSERT INTO finance.impairment_report (
    snapshot_date,
    stage,
    total_exposure,
    total_ecl
)
SELECT
    snapshot_date,
    stage,
    SUM(exposure_amount),
    SUM(ecl)
FROM risk.ifrs9_exposure_snapshot
WHERE snapshot_date = DATE '2026-03-31'
GROUP BY snapshot_date, stage;