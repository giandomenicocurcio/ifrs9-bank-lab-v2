import pandas as pd
import numpy as np
import random

# Load existing exposures
df = pd.read_csv("../../data/raw/exposures.csv")

# ----------------------------
# SIMULATE CHANGES
# ----------------------------

for i in df.index:

    # 20% deteriorate
    if random.random() < 0.2:
        df.at[i, "days_past_due"] += random.choice([15, 30])

    # 10% improve
    elif random.random() < 0.1:
        df.at[i, "days_past_due"] = max(0, df.at[i, "days_past_due"] - 15)

# ----------------------------
# SAVE AS NEW SNAPSHOT
# ----------------------------

df.to_csv("../../data/raw/exposures_2026_04_30.csv", index=False)

print("✅ April exposures updated")