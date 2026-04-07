-- @formatter:off
------------------------------
--load customers
------------------------------
\copy staging.customers FROM '/home/gcquant/ifrs9_bank_lab_v2/data/raw/customers.csv' DELIMITER ',' CSV HEADER;
------------------------------
--load accounts
------------------------------
\copy staging.accounts FROM '/home/gcquant/ifrs9_bank_lab_v2/data/raw/accounts.csv' DELIMITER ',' CSV HEADER;
------------------------------
--load transactions
------------------------------
\copy staging.transactions FROM '/home/gcquant/ifrs9_bank_lab_v2/data/raw/transactions.csv' DELIMITER ',' CSV HEADER;
------------------------------
--load exposures
------------------------------
\copy staging.exposures FROM '/home/gcquant/ifrs9_bank_lab_v2/data/raw/exposures.csv' DELIMITER ',' CSV HEADER;
------------------------------
--load payments
------------------------------
\copy staging.payments FROM '/home/gcquant/ifrs9_bank_lab_v2/data/raw/payments.csv' DELIMITER ',' CSV HEADER;
-- @formatter:on




