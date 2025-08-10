# RFM Segmentation Script for E-commerce Customer Behavior Analysis
# Project by Mohsin Ijaz

# Load Required Libraries
library(dplyr)
library(readxl)
library(lubridate)

# Step 1: Load Data (Replace 'your_file.xlsx' with actual file path)
data <- read_excel("cleaned_data.xlsx")

# Step 2: Rename Columns for Simplicity (if needed)
colnames(data) <- c("InvoiceNo", "StockCode", "Description", "Quantity", "InvoiceDate", "UnitPrice", "CustomerID", "Country")

# Step 3: Create 'TotalAmount' column
data <- data %>%
  mutate(TotalAmount = Quantity * UnitPrice)

# Step 4: Remove Missing Customer IDs and NA Values
data <- data %>%
  filter(!is.na(CustomerID), !is.na(TotalAmount))

# Step 5: Convert InvoiceDate to Date format
data$InvoiceDate <- as.Date(data$InvoiceDate)

# Step 6: Set Analysis Date (latest date in data + 1)
analysis_date <- max(data$InvoiceDate) + 1

# Step 7: Calculate RFM Metrics
rfm_table <- data %>%
  group_by(CustomerID) %>%
  summarise(
    Recency = as.numeric(analysis_date - max(InvoiceDate)),
    Frequency = n_distinct(InvoiceNo),
    Monetary = sum(TotalAmount)
  )

# Step 8: Assign RFM Scores (1 = Low, 3 = High)
rfm_table <- rfm_table %>%
  mutate(
    R_score = ntile(-Recency, 3),
    F_score = ntile(Frequency, 3),
    M_score = ntile(Monetary, 3)
  )

# Step 9: Create Customer Segments Based on Scores
rfm_table <- rfm_table %>%
  mutate(Segment = case_when(
    R_score == 3 & F_score == 3 & M_score == 3 ~ "Best",
    R_score == 3 & F_score == 2 ~ "Loyal",
    R_score == 2 & F_score == 2 ~ "Potential",
    R_score == 1 & F_score == 3 ~ "At Risk",
    R_score == 1 & F_score == 1 ~ "Lost",
    TRUE ~ "Others"
  ))

# Step 10: Save Final RFM Table to CSV
write.csv(rfm_table, "rfm_segmented.csv", row.names = FALSE)

# ✅ Done! This file is ready for Tableau dashboard creation.