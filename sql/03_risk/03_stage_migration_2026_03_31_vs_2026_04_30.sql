------------------------------
--strage migration analysis
------------------------------
SELECT
    prev.stage AS previous_stage,
    curr.stage AS current_stage,
    COUNT(*) AS exposures,
    SUM(curr.exposure_amount) AS total_exposure,
    SUM(curr.ecl) AS total_ecl
FROM risk.ifrs9_exposure_snapshot curr
JOIN risk.ifrs9_exposure_snapshot prev
    ON curr.exposure_id = prev.exposure_id
WHERE curr.snapshot_date = DATE '2026-04-30'
  AND prev.snapshot_date = DATE '2026-03-31'
GROUP BY prev.stage, curr.stage
ORDER BY prev.stage, curr.stage;