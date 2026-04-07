------------------------------
--ECL by stage
------------------------------
\copy (SELECT 'Stage ' || stage AS stage, SUM(ecl) AS total_ecl FROM risk.ifrs9_exposure_snapshot WHERE snapshot_date = DATE '2026-04-30' GROUP BY stage ORDER BY stage) TO '/home/gcquant/ifrs9_bank_lab_v2/reports/csv/pbi_ecl_by_stage.csv' CSV HEADER;