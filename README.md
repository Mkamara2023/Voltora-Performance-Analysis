

<img width="1200" height="800" alt="ChatGPT Image Jan 15, 2026, 03_28_49 PM" src="https://github.com/user-attachments/assets/b31652e4-7327-40bb-a191-f398a27ab0db" />


# Voltora- Performance Analysis

# Table of Contents
* [Project Background](#project-background)
* [Executive Summary](#executive-summary)
* [North Star Metrics](#Northstar-Metrics)
* [Customer Lifecycle Stability](#Customer-Lifecycle-Stability)
* [Volatility Analysis](#Volatility-Analysis)
* [Volume vs Revenue Concentration](Volume-vs-Revenue-Concentration)


__ __ 



# Project Background



__Voltora__ is a growing e-commerce retailer specialising in consumer electronics, offering a portfolio that
spans high-value devices such as laptops and tablets alongside high-volume accessories. 

As the business scaled, leadership identified a need to better understand what is truly driving revenue across the product
portfolio, and where the largest opportunities exist to improve Average Order Value (AOV). 

I partnered with the Head of Operations to analyse transactional sales data with the goal of supporting more
informed decisions across sales, product, and marketing teams.


# Executive summary 

Voltora’s sales analysis of approximately 25,000 e-commerce transactions between 2022 and 2024
reveals a top-heavy product portfolio, where a small number of premium products drive a
disproportionate share of total revenue. During this period, Voltora generated $4.09M in total revenue,
with performance largely concentrated in high-value laptop products.

Premium laptops—including the ASUS ROG Zephyrus, HP Spectre x360, Lenovo ThinkPad X1,
and Dell XPS 13—account for over 40% of total revenue, despite representing a relatively small share
of total order volume. These products exhibit the highest Average Order Values (AOV) in the catalog,
ranging from $965 to $1,018 per order, indicating that revenue growth is currently driven by
transaction value rather than sales volume.

In contrast, accessories such as HDMI cables, portable SSDs, power banks, and USB-C chargers
generate high order volume but contribute less than 3% of total revenue, with AOVs averaging around
$40. While these items play a limited role as standalone revenue drivers, they represent a significant
missed cross-sell opportunity. Market basket analysis confirms a zero-attachment rate between
hardware and accessories a factor directly linked to the identified 15% year-over-year decline in
unique customers.

Mid-tier products—including smartphones and gaming devices—provide a stabilizing layer of
revenue, contributing approximately 25–30% of sales through consistent order volume and moderate
AOVs. While this segment supports cash flow, it does not materially shift overall revenue performance.
The findings suggest that Voltora’s strongest opportunity lies in optimizing product strategy
through bundling, cross-sell initiatives, and targeted merchandising.

Addressing the "Single-Item Trap" by improving accessory attachment rates could materially increase Average Order Value and
unlock incremental revenue without relying on increased customer acquisition costs.

## Dataset Structure and ERD (Entity Relationship Diagram)


__This database structure as seen below consists of four tables: Orders, Customers, Geo-lookup and Order_status, with a total row count of 25,000 records.__

 
![ecommerce_ERD](https://github.com/user-attachments/assets/c1fa6381-6535-48b5-b6a5-db3003f5adcf)
Voltora Dataset ERD

# Northstar Metrics 

__Customer Lifecycle Stability__  – Analysing month-over-month trends in unique customer
retention to ensure long-term brand health. Monthly Metrics reveal a 15% year-over-year
decline in unique customers, highlighting a critical need to convert "one-off" buyers into repeat
ecosystem shoppers.

__Revenue vs. Volume Concentration__ – Evaluating the balance between high-ticket revenue
drivers and high-frequency volume drivers. Analysis shows that a top-heavy portfolio relies on
a small number of hardware launches, with 16 products generating 80% of total revenue,
creating a significant dependency on flagship device performance.

__Premium AOV Efficiency__ – Analysing the "upsell" performance of top revenue-driving
products to maximize transaction value. While Pareto Analysis shows premium laptops drive
over 40% of revenue, current transaction data identifies a 0% accessory attachment rate at the
point of hardware sale.

__Ecosystem Attachment Rate (AAR)__ – Analysing the frequency of multi-item transactions
versus standalone purchases to evaluate cross-sell efficiency. Current analysis of the Cross-
Sell Heatmap confirms a "Single-Item Trap," where customers purchase products in total
isolation, missing high-margin accessory revenue and reducing customer lifetime value.

__ __ 

## Customer Lifecycle Stability

<img width="1200" height="800" alt="Monthly Metrics (Monthly Order Volume Trends)-2" src="https://github.com/user-attachments/assets/d0974048-16dc-436c-bfd7-6a6426ffa45e" />

__ __

__Baseline Demand Volatility__: Longitudinal analysis of transaction volume reveals significant
monthly fluctuations across all three years. __While Q1 starts with "Steady Demand"__ mirroring stable
baseline needs, the business faces a recurring __Q2–Q3 Mid-Year Slowdown__ where order counts dip to
their lowest annual levels.

__The Retention Decay__: Despite the recurring __Q4 Seasonal Lift__ driven by aggressive holiday demand
and promotional events there is a measurable __15% year-over-year decline in unique customer
activity.__ This indicates that Voltora is successful at capturing "seasonal shoppers" but is failing to
convert them into long-term brand loyalists.

__Acquisition Dependency__: The current growth model is heavily reliant on expensive new customer
acquisition during peak periods. The sharp drop-off in volume following November peaks suggests a
"one-and-done" purchasing pattern, leaving the business vulnerable to high revenue instability during
non-promotional months.

__Critical Operational Conclusion__: The consistency of the __Q2–Q3 dip__ across 2022, 2023, and
2024 proves that the current product strategy is not sustaining year-round interest. To stabilize
the customer lifecycle, the business must pivot toward products or services that incentivize
mid-year engagement and repeat transactions. 

## Volatility Analysis - Volume vs. Price 


<img width="1200" height="800" alt="Sales vs AOV Growth (MoM)" src="https://github.com/user-attachments/assets/826056de-01af-4124-b1a7-bc2eb9583956" />

__ __ 

__Volume-Driven Revenue Swings__: The analysis confirms that Voltora’s revenue fluctuations are
primarily driven by __order volume__ rather than strategic pricing adjustments.

__The February "True Revenue Decline"__: February represents the most significant risk period, where
a simultaneous drop in both volume (Sales Growth) and transaction value (AOV Growth) indicates a
severe __post-holiday demand shock.__ 

__The November "Efficiency Peak":__ November is the only month where both metrics align positively.
This "Perfect Surge" confirms that the business is currently optimized for __holiday hardware
acquisition__ but lacks a stable "floor" for the rest of the year.

__The August "Demand Gap":__ A major dip in August shows that even when customers buy, they are
buying significantly cheaper items, dragging down the total revenue health of the company.

__ __

## Volume vs Revenue Concentration 

<img width="1200" height="800" alt="Product Pareto – Volume vs Revenue-2" src="https://github.com/user-attachments/assets/4bee2dda-d603-44df-8fc9-61bfcc137965" />

__ __ 

__The 80/20 Revenue Distribution__: A Pareto analysis confirms that Voltora’s financial health is
heavily concentrated. Out of the entire product catalog, only 16 flagship products (approx. 6%)
generate 80% of the total $4.09M revenue.

__The High-Volume/Low-Impact Gap__: There is a significant disconnect between what customers buy
most frequently and what drives the bottom line. High-volume items, such as the Xiaomi Mi 11 and
Sony Headphones, facilitate high warehouse activity but contribute less than 3% to total revenue.

__Core Hardware Dependency__: Revenue is primarily anchored by four premium laptops: the ASUS
ROG Zephyrus, HP Spectre x360, Lenovo ThinkPad X1, and Dell XPS 13. These units command an
Average Order Value (AOV) of $960–$1,018, making them the primary engines of growth.

__Critical Operational Risk__: This "top-heavy" structure creates a high dependency risk. Because 80%
of revenue relies on a narrow selection of 16 items, any supply chain disruption, stock-out, or
competitive price-undercutting of these specific models would lead to an immediate and material
impact on total company earnings.

## Premium AOV Efficiency 

<img width="1200" height="900" alt="Average Order Value by Product-2" src="https://github.com/user-attachments/assets/b79ac352-f4fc-4721-b0b5-44ae117c3352" />

__ __

__Flagship Price Anchoring__: Analysis confirms that premium hardware products serve as the primary
"price anchors" for the entire catalog. The top five products—led by the __ASUS ROG Zephyrus,
MacBook Air M2, and Dell XPS 13__—command an Average Order Value (AOV) of approximately
__$960 to $1,018.__ 

__The 2.7x Revenue Multiplier__: These flagship laptops drive a transaction value that is __2.7x higher
than the store-wide average__. This confirms that Voltora’s revenue health is fundamentally
dependent on high-ticket hardware sales rather than consistent volume across all categories.

__Low-Margin Volume Centres__: Conversely, high-volume accessories like __4K HDMI Cables, USB-
C Chargers, and MagSafe Power Banks__ sit at the bottom of the efficiency scale, with an AOV of
roughly __$40__. While these items facilitate high transactiion frequency, they currently contribute
negligible value to the total revenue per customer.

__The "Attachment Gap"__: The extreme gap between the top-performing hardware ($1,000+) and the
high-volume accessories ($40) highlights a significant __unrealized cross-sell opportunity__. The
current data suggests these products are purchased in silos; "attaching" even one $40 accessory to a
flagship laptop sale would represent a 4% increase in that order's total value

__ __ 

## Ecosystem Attachment Rate

<img width="2784" height="916" alt="Market Basket Analysis_ Attachment Gap" src="https://github.com/user-attachments/assets/aa61922a-b74e-4bef-96f4-067e43babe02" />

__ __ 

__The Transactional Silo__: A Market Basket Analysis of the 25,000 transactions reveals a persistent
__"Single-Item Trap,"__ where products are purchased in total isolation.

__Zero-Attachment Correlation__: The heatmap shows a heavy concentration only along the diagonal
axis, confirming a __0% accessory attachment rate__ at the point of hardware sale. Despite high
volumes of items like USB-C Chargers and HDMI Cables, these peripherals are almost never bundled
with flagship laptops.

__Root Cause of Retention Decay__: This lack of an integrated "ecosystem" is the primary driver
behind the __15% year-over-year decline in unique customers__. Because customers are not
incentivized to purchase their entire setup at Voltora, they satisfy secondary needs elsewhere, ending
their brand lifecycle after a single high-value purchase.

__Revenue Leakage__: By failing to bridge the gap between __$1,000 hardware anchors__ and __$40
accessories__, Voltora is experiencing significant revenue leakage. Capturing even a small percentage
of this missing attachment would materially increase Average Order Value without requiring
additional customer acquisition costs.

__The Impact__: This aligns the high-frequency volume drivers with the high-ticket revenue drivers,
fixing the Structural Portfolio Risk where 80% of revenue is anchored to a dangerously narrow
selection of items.

__ __ 

## Strategic Recommendations & Roadmap 

### Maximizing Portfolio Efficiency

__Implement Ecosystem Bundling__: Create "Core Essential" kits for the 16 flagship hardware products
that drive 80% of revenue. By bundling a high-volume $40 accessory at the point of hardware sale,
Voltora can bridge the "Attachment Gap" and realize an immediate __4% increase in per-order AOV__.

__Optimize Low-Margin Volume Centre’s__: Re-position standalone accessories like 4K HDMI Cables
and MagSafe Power Banks as "Add-on Essentials" within the digital checkout flow. This shifts high-
frequency items from negligible standalone sales to high-margin upsells for larger orders.

### Customer Growth and Retention 

__Boost Repeat Purchases__: Address the __15% year-over-year retention decline__ by launching an
automated "30-Day Post-Purchase" re-engagement sequence. Target hardware buyers with
personalized offers for compatible peripherals (audio, storage, charging) to convert "one-off" buyers
into repeat ecosystem shoppers.

__Leverage Core Customer Insights__: Analyse the behaviours of high-AOV repeat customers to
refine tiered rewards. Introduce referral incentives that reward existing flagship owners for bringing in
new premium-segment customers, reducing acquisition dependency.

### Revenue Stabilization & Seasonal Optimization

__Stabilize Off-Peak Revenue Floors__: Introduce "Ecosystem Refresh" promotions during the
identified __February and August demand shocks__. By focusing on accessory volume during these
periods, Voltora can maintain transaction frequency and a stable cash flow "floor" when hardware
demand naturally dips.

__Maintain Quality Integrity__: Sustain the current low refund rates by replicating successful 2023
quality control practices. Ensure that increased accessory volume is supported by detailed product
descriptions and robust post-purchase support to meet customer expectations.

__Focus on High-Performing Regional Hubs__: Allocate marketing resources to top-performing
geographic regions identified in the audit. Utilize regionalized promotions to solidify market presence
and reduce the volatility seen during off-peak months.

### Operational & Platform Enhancement

__Enhance Mobile Ecosystem Experience__: Improve the mobile app’s "One-Click Bundle" features
to capitalize on rising mobile usage. Streamlining the path from a $1,000 laptop to a complete setup
will reduce cart abandonment and increase AOV.

__ __ 

# Clarifying Questions

__Customer ID Mapping__: Does the customer_id consistently track the same individual across
guest checkouts and registered accounts, or could a single user generate multiple unique IDs?

__Marketing Spend Context__: Was there a significant reduction in top-of-funnel marketing spend
or a change in acquisition channels between 2023 and 2024 that could correlate with the 15%
retention decline?

__Inventory Availability__: Were the 16 flagship hardware products consistently in stock during
the "Demand Shock" months (February and August), or were these revenue dips influenced
by supply chain shortages?

__ __ 

# Project Assumptions 

__Data Completeness__: It is assumed that the Orders_Cleaned table represents a full and final
record of all successful transactions, excluding test orders, employee purchases, or pending
returns.

__Currency Standardization__: All financial figures are assumed to be standardized in USD based
on historical exchange rates at the time of the transaction.

__External Stability__: The analysis assumes that the 15% decline in retention is an internal
performance trend and does not account for external macroeconomic shifts or major
competitor price wars.

__ __ 

# Caveats & Limitations 

__Correlation vs. Causality__: This analysis identifies a strong correlation between zero accessory
attachment and declining retention. However, without qualitative customer feedback, we
cannot definitively claim that a lack of bundling is the sole cause of customer churn.

__Gross vs. Net Revenue__: All insights are based on Gross Revenue. The analysis does not
account for Cost of Goods Sold (COGS), shipping overheads, or marketing CAC (Customer
Acquisition Cost), which may vary between hardware and accessory categories.

__Guest Checkout Bias__: If a high percentage of transactions are processed via "Guest
Checkout" without persistent identifiers, the reported 15% retention decay may be slightly
overstated due to ID fragmentation.

__ __ 
