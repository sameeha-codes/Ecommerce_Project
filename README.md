# E-commerce Sales Analysis (October & November 2019)

**Author:** Sameeha H  
**Date:** August 2025 

## 📌 Project Overview
SQL-driven analysis of customer behavior events — `view`, `cart`, and `purchase` — for a multi-category e-commerce store.  
Focus areas:
- Sales trends over time
- Product performance (top sellers)
- Conversion funnel (view → cart → purchase)

--- 

## 📦 Dataset Source
- Kaggle: *Ecommerce behavior data from multi-category store* by mkechinov  
  (Note: Raw CSVs and the SQLite DB are **not included** in this repo due to GitHub’s 100MB file limit.)

**Files used locally (not in repo):**
- `data_raw/2019-Oct.csv`
- `data_raw/2019-Nov.csv`
- `ecommerce.db` (SQLite created locally)

---

## 🗂 Project Structure
```
Ecommerce_Project/
│── data_raw/ # Raw dataset files (NOT in repo due to size, see Kaggle link below)
│── ecommerce/ # (optional) configs or notes (can be empty if not used)
│── ecommerce_sales_analysis.sql # All SQL queries used
│── README.md # Project documentation
│── .gitignore # Ignores large files (csv/db)
```
---
## 🧠 What Each SQL Block Does (plain English)
- **Row count:** How many events exist in the table.
- **Event distribution:** How many `view`, `cart`, `purchase` events — helps see funnel volume.
- **Top products:** Which `product_id`s were purchased the most.
- **Purchases by day:** Daily totals (helps spot spikes/dips).
- **Daily views/carts/purchases:** Side-by-side daily trend lines.
- **Conversion rates (daily):**  
  - `cart_rate_percent = carts / views`  
  - `purchase_rate_percent = purchases / carts`
- **Monthly summary:** Combines Oct + Nov by month for a quick side-by-side.

> All SQL is saved in: **`ecommerce_sales_analysis.sql`**

---

## 🔁 How To Reproduce (2 simple options)

### Option A — Use your own SQLite (DB Browser for SQLite)
1. Download the Kaggle dataset and unzip it.
2. Open **DB Browser for SQLite** → **New Database** → save as `ecommerce.db`.
3. **Import** → **Table from CSV**:
   - Import `2019-Oct.csv` → table name: `sales_oct`
   - Import `2019-Nov.csv` → table name: `sales_nov`
   - Keep `event_time` as **TEXT** (it’s in ISO string form, e.g., `2019-10-01 12:34:56 UTC`)
4. Open the **Execute SQL** tab.
5. Click **Open SQL file** → select `ecommerce_sales_analysis.sql`.
6. Run the queries and view results.

### Option B — Run only a subset (quick check)
If you only imported October, change table names in queries to `sales_oct` and run the daily trend and funnel queries to verify.

---

## 🔎 Key Insights (fill these after you run)
- **Funnel volume:** `views > carts > purchases` as expected; largest drop is usually view → cart.  
- **Best days:** (e.g., “Late Oct weekends showed higher purchases.”)  
- **Top products:** (e.g., “Product X consistently top 3 in Oct & Nov.”)  
- **Conversion:** (e.g., “Cart rate ~x%, purchase rate ~y% across the two months.”)


---

## ▶️ How to Run the SQL (quick start)
1. Clone or download this repo.
2. Open your SQLite tool (e.g., DB Browser).
3. Import CSVs as `sales_oct` and `sales_nov` (as above).
4. Open and run `ecommerce_sales_analysis.sql`.

---

## 🚀 Future Improvements
- Add visualizations (daily trend lines, conversion funnel chart).
- Build category-level insights (if category data is available).
- Segment by user/city/device (if fields exist in raw data).
- Compare pre- and post-promotion windows.

---

## 📄 Notes
Large files are intentionally ignored via `.gitignore`:
data_raw/*.csv
ecommerce.db

