# 🛍️ E-commerce Customer Behavior Dashboard  
_A Data-Driven Storytelling Project by Mohsin Ijaz_

## 🔍 Objective:
To analyze e-commerce customer behavior using RFM segmentation and visualize customer patterns with Tableau for business insights.

---

## 📊 Tools Used:
- **Excel** – Data cleaning and preparation
- **R (RStudio)** – RFM segmentation using `dplyr`, `lubridate`
- **Tableau** – Storytelling dashboards with advanced visuals

---

## 🧠 Process Overview:

### 1️⃣ Data Cleaning:
- Removed empty and null rows in Excel
- Parsed dates and ensured numeric columns were correctly formatted
- Calculated `TotalAmount = Quantity * UnitPrice`

### 2️⃣ RFM Segmentation in R:
- **Recency:** Days since last purchase
- **Frequency:** Number of unique invoices
- **Monetary:** Total amount spent
- Segmented customers into:
  - Best
  - Loyal
  - Potential
  - At Risk
  - Lost
  - Others

### 3️⃣ Visualization in Tableau:
Created a 2-dashboard storytelling flow using black backgrounds and neon accent colors:
1. **Who Are Our Customers?**  
   - Pie charts, distribution bars, RFM breakdown
2. **How Do They Behave Over Time?**  
   - Monthly trends, frequency patterns, heatmaps

Final story includes recommendation slide:
> 📌 “Focus on retention of high-value segments and reactivation of at-risk customers.”

---

## 📁 Files Included:
- `cleaned_data.xlsx`
- `rfm_segmentation.R`
- `rfm_segmented.csv`
- `dashboard1.png`, `dashboard2.png`
- Tableau `.twbx` file (if exporting)
- This `summary.md`

---

## 🔗 Project Author:
**Mohsin Ijaz**  
Google Certified Data Analyst  
LinkedIn | Fiverr | Tableau Public
