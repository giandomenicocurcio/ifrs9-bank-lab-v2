TRUNCATE staging.exposures;

\copy staging.exposures FROM '/home/gcquant/ifrs9_bank_lab_v2/data/raw/exposures_2026_04_30.csv' DELIMITER ',' CSV HEADER;