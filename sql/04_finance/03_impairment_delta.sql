SELECT
    curr.stage,
    curr.total_ecl AS ecl_current,
    prev.total_ecl AS ecl_previous,
    curr.total_ecl - prev.total_ecl AS impairment_delta
FROM finance.impairment_report curr
LEFT JOIN finance.impairment_report prev
    ON curr.stage = prev.stage
    AND prev.snapshot_date = DATE '2026-03-31'
WHERE curr.snapshot_date = DATE '2026-04-30'
ORDER BY curr.stage;