import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

# ----------------------------
# PARAMETERS
# ----------------------------
NUM_CUSTOMERS = 600
np.random.seed(42)

# ----------------------------
# CUSTOMERS
# ----------------------------
customers = []

for i in range(1, NUM_CUSTOMERS + 1):
    customers.append({
        "customer_id": i,
        "first_name": f"Name_{i}",
        "last_name": f"Surname_{i}",
        "date_of_birth": datetime(1960, 1, 1) + timedelta(days=random.randint(0, 20000)),
        "country": "CH",
        "segment": random.choice(["retail", "sme"])
    })

df_customers = pd.DataFrame(customers)

# ----------------------------
# ACCOUNTS
# ----------------------------
accounts = []

account_id = 1

for _, row in df_customers.iterrows():
    num_accounts = random.randint(1, 2)

    for _ in range(num_accounts):
        accounts.append({
            "account_id": account_id,
            "customer_id": row["customer_id"],
            "account_type": random.choice(["current", "savings"]),
            "currency": "CHF",
            "balance": round(random.uniform(1000, 50000), 2)
        })
        account_id += 1

df_accounts = pd.DataFrame(accounts)

# ----------------------------
# SAVE CSV
# ----------------------------
df_customers.to_csv("../../data/raw/customers.csv", index=False)
df_accounts.to_csv("../../data/raw/accounts.csv", index=False)

print("✅ Customers and Accounts generated")

# ----------------------------
# TRANSACTIONS
# ----------------------------
transactions = []
transaction_id = 1

for _, acc in df_accounts.iterrows():
    num_tx = random.randint(5, 20)

    for _ in range(num_tx):
        transactions.append({
            "transaction_id": transaction_id,
            "account_id": acc["account_id"],
            "transaction_type": random.choice(["deposit", "withdrawal", "card"]),
            "amount": round(random.uniform(10, 2000), 2),
            "transaction_date": datetime(2025, 1, 1) + timedelta(days=random.randint(0, 365)),
            "description": "auto_generated"
        })
        transaction_id += 1

df_transactions = pd.DataFrame(transactions)

# ----------------------------
# EXPOSURES (Loans)
# ----------------------------
exposures = []
exposure_id = 1

for _, acc in df_accounts.iterrows():
    if random.random() < 0.4:  # 40% of accounts have loans

        exposure_amount = round(random.uniform(5000, 50000), 2)

        exposures.append({
            "exposure_id": exposure_id,
            "customer_id": acc["customer_id"],
            "account_id": acc["account_id"],
            "exposure_type": random.choice(["loan", "credit_card"]),
            "exposure_amount": exposure_amount,
            "interest_rate": round(random.uniform(2, 10), 2),
            "start_date": datetime(2023, 1, 1),
            "maturity_date": datetime(2028, 1, 1),
            "days_past_due": random.choice([0, 0, 0, 15, 30, 60, 90]),
            "status": "active",
            "credit_score": random.randint(300, 850)
        })

        exposure_id += 1

df_exposures = pd.DataFrame(exposures)

# ----------------------------
# PAYMENTS
# ----------------------------
payments = []
payment_id = 1

for _, exp in df_exposures.iterrows():
    num_payments = random.randint(3, 10)

    for _ in range(num_payments):
        status = random.choice(["paid", "late", "missed"])

        payments.append({
            "payment_id": payment_id,
            "exposure_id": exp["exposure_id"],
            "payment_date": datetime(2025, 1, 1) + timedelta(days=random.randint(0, 365)),
            "amount": round(exp["exposure_amount"] / 12, 2),
            "payment_status": status
        })

        payment_id += 1

df_payments = pd.DataFrame(payments)

df_transactions.to_csv("../../data/raw/transactions.csv", index=False)
df_exposures.to_csv("../../data/raw/exposures.csv", index=False)
df_payments.to_csv("../../data/raw/payments.csv", index=False)

print("✅ Transactions, Exposures, Payments generated")