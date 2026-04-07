------------------------------
--export to csv
-------------------------------


\copy (SELECT 'Stage ' || curr.stage AS stage, curr.total_ecl - prev.total_ecl AS delta FROM finance.impairment_report curr LEFT JOIN finance.impairment_report prev ON curr.stage = prev.stage AND prev.snapshot_date = DATE '2026-03-31' WHERE curr.snapshot_date = DATE '2026-04-30' ORDER BY curr.stage) TO '/home/gcquant/ifrs9_bank_lab_v2/reports/csv/pbi_waterfall.csv' CSV HEADER;