# Reducing Revenue Leakage in Ride-Hailing Operations: A Data Analysis of Cancellations, Demand, and Efficiency.

## Project Overview

This project analyzes ride-hailing data to evaluate booking performance, revenue generation, cancellation behavior, and customer usage patterns.

Using SQL, key business queries were performed to extract insights such as successful bookings, ride distance trends, cancellation counts, and top customers. These insights were then visualized in Power BI through an interactive dashboard to monitor ride efficiency, revenue distribution, and operational performance.

This project focuses on SQL-driven data analysis combined with Power BI visualization to evaluate ride performance, revenue trends, customer behavior, and operational efficiency.

---

## Executive Summary

This analysis evaluates ride-hailing operations with a focus on revenue generation, ride completion efficiency, and cancellation behavior.

Out of 71.2K total bookings, only 62.1% were successfully completed, resulting in 39.03M in realized revenue. However, a significant portion of demand fails to convert into completed rides, highlighting a critical gap between customer demand and revenue realization.

The analysis identifies cancellations, operational delays (C_TAT & V_TAT), and inconsistent service quality as key drivers of inefficiency. Additionally, revenue is concentrated across a limited set of payment methods and customer segments.

Overall, the findings indicate that improving ride completion rates and operational efficiency presents a larger revenue opportunity than increasing customer acquisition.

---
## Business Context

Ride-hailing operations depend heavily on ride completion rates, cancellation behavior, and customer demand patterns, all of which directly impact revenue and service efficiency.

This analysis focuses on:

- Monitoring successful vs cancelled rides to understand operational efficiency

- Identifying cancellation patterns from both customers and drivers

- Analyzing revenue contribution across vehicle types and payment methods

- Evaluating customer behavior and ride frequencye

---

## Business Objectives

- Analyze total bookings and successful ride rate

- Evaluate revenue performance (booking value trends)

- Identify cancellation patterns by customers and drivers

- Measure average ride distance and customer ratings

- Identify top customers based on ride frequency

- Understand payment method contribution to revenue

---

Dataset Preview

![Dataset Preview](ola_dataset_preview.png)

---

## Dataset Information


| Column Name                | Data Type | Description                                              | Business Relevance |
|----------------------------|----------|------------------------------------------------------------|--------------------|
| Date                       | Date     | Ride booking date                                          | Used for trend analysis and time-based insights |
| Time                       | Time     | Ride booking time                                          | Helps identify peak demand hours |
| Booking_ID                 | String   | Unique ride identifier                                     | Used to count total rides |
| Booking_Status             | String   | Status (Success, Cancelled, Incomplete)                    | Key metric for ride success and cancellations |
| Customer_ID                | String   | Unique customer identifier                                 | Used for customer-level analysis |
| Vehicle_Type               | String   | Type of vehicle booked                                     | Helps analyze performance across vehicle categories |
| Pickup_Location            | String   | Ride pickup location                                       | Useful for location-based demand analysis |
| Drop_Location              | String   | Ride drop location                                         | Helps identify popular routes |
| V_TAT                      | Integer  | Vehicle Turnaround Time (time to assign vehicle)           | Measures operational efficiency |
| C_TAT                      | Integer  | Customer Waiting Time before ride start                    | Impacts customer satisfaction |
| Canceled_Rides_by_Customer | String   | Reason for cancellation by customer                        | Helps identify customer-side issues |
| Canceled_Rides_by_Driver   | String   | Reason for cancellation by driver                          | Helps identify driver-side issues |
| Incomplete_Rides           | String   | Indicates whether a ride was incomplete                    | Tracks failed ride executions |
| Incomplete_Rides_Reason    | String   | Reason for incomplete rides                                | Helps diagnose operational failures |
| Booking_Value              | Decimal  | Total fare amount                                          | Core revenue metric |
| Payment_Method             | String   | Mode of payment (Cash, UPI, etc.)                          | Helps analyze payment behavior |
| Ride_Distance              | Decimal  | Distance traveled per ride                                 | Used for pricing and demand analysis |
| Driver_Ratings             | Decimal  | Rating given to driver                                     | Measures driver performance |
| Customer_Rating            | Decimal  | Rating given by customer                                   | Measures customer satisfaction |

---

## DAX Calculations

**Total Rides** = 
COUNT(ride_data[Booking_ID])


**Successful Rides** = 
CALCULATE(
    COUNT(ride_data[Booking_ID]),
    ride_data[Booking_Status] = "Success"
)


**Successful Ride Rate** = 
DIVIDE(
    [Successful Rides],
    [Total Rides]
)


**Successful Booking Value** = 
CALCULATE(
    SUM(ride_data[booking_value]),
    ride_data[Booking_Status] = "Success"
)

---

## Revenue Leakage Analysis

Business Question:
How much potential revenue is lost due to unsuccessful bookings?

Key Insight:
Out of 71.2K total bookings, only 62.1% are successfully completed, meaning nearly 38% of demand fails to convert into revenue.

With total revenue at 39.03M, this indicates a significant portion of potential revenue is lost due to cancellations and incomplete rides.

Business Impact:
This is not just an operational inefficiency — it represents a direct revenue leakage problem, where existing demand is not being fully monetized.

Recommendation:

Prioritize reducing cancellations over acquiring new users
Even a 5–10% improvement in ride success rate could significantly increase revenue without additional customer acquisition cost

---

# SQL Analysis

SQL was used to perform detailed data analysis and answer specific business questions, including ride success rates, cancellation behavior, customer patterns, and revenue calculations.

The SQL analysis forms the foundation for insights visualized in the Power BI dashboard.


## 1. Ride Success Analysis

Business Question:
How many rides are successfully completed?

Key Insight:
A significant portion of rides are successfully completed, forming the base for revenue generation.

Business Recommendation:
Focus on improving the success rate further to maximize revenue and operational efficiency.

--- 

## 2. Ride Distance by Vehicle Type

Business Question:
What is the average ride distance for each vehicle type?

Key Insight:
Different vehicle types serve different distance ranges, indicating varied customer usage patterns.

Business Recommendation:
Align vehicle allocation and pricing strategies based on trip distance patterns.

---

## 3. Customer Cancellation Analysis

Business Question:
How many rides are cancelled by customers?

Key Insight:
Customer cancellations contribute to ride inefficiency and lost revenue opportunities.

Business Recommendation:
Improve booking experience and reduce wait times to minimize customer-side cancellations.

---

## 4. High-Value Customer Identification

Business Question:
Who are the top 5 customers based on ride frequency?

Key Insight:
A small segment of customers contributes significantly to total bookings.

Business Recommendation:
Introduce loyalty programs to retain and reward high-frequency users.

---

## 5. Driver Cancellation Behavior

Business Question:
How many rides are cancelled by drivers due to personal or vehicle issues?

Key Insight:
Driver-side cancellations highlight operational and availability challenges.

Business Recommendation:
Implement driver incentives and accountability systems to reduce cancellations.

---

## 6. Driver Performance (Ratings)

Business Question:
What are the maximum and minimum driver ratings for Prime Sedan rides?

Key Insight:
Driver performance varies significantly, indicating inconsistency in service quality.

Business Recommendation:
Monitor low-performing drivers and improve service standards through training.

---

## 7. Payment Method Usage (UPI)

Business Question:
How many rides are completed using UPI payments?

Key Insight:
UPI is a frequently used payment method, reflecting customer preference for digital payments.

Business Recommendation:
Promote digital payments further with incentives and seamless experience.

---

## 8. Customer Satisfaction by Vehicle Type

Business Question:
What is the average customer rating across vehicle types?

Key Insight:
Customer satisfaction varies across vehicle categories.

Business Recommendation:
Focus on improving service quality in lower-rated vehicle segments.

---

## 9. Revenue from Successful Rides

Business Question:
What is the total booking value from successful rides?

Key Insight:
Revenue is directly tied to successful ride completion.

Business Recommendation:
Increase ride success rate to maximize revenue generation.

---

## 10. Incomplete Ride Analysis

Business Question:
What are the reasons for incomplete rides?

Key Insight:
Incomplete rides indicate operational failures and service disruptions.

Business Recommendation:
Identify and fix recurring issues causing incomplete rides.

---

The insights derived from SQL analysis were used to design key metrics and visualizations in the Power BI dashboard:

- Ride success rate → KPI Card
- Revenue from successful bookings → KPI & Trend Chart
- Top customers → Table visualization
- Vehicle performance → Bar Chart
- Payment method usage → Pie Chart

---

## Dashboard Preview

![Dashboard](ola_dashboard_overview.png)

---

## Key Performance Indicators

- Total Revenue: 39.03M

- Total Bookings: 71.20K

- Successful Rides: 44.27K

- Successful Ride Rate: 62.18%

- Average Ride Distance: 14.21 km

- Average Customer Rating: 4.00

---

## Dashboard Features

- Revenue trend analysis over the last 30 days

- Booking status distribution (Success vs Cancellations)

- Revenue breakdown by payment method

- Vehicle-wise performance metrics

- Customer and driver rating comparison

- Identification of top 5 high-value customers

- Interactive filters for dynamic analysis

---

## Business Questions

- What percentage of total bookings are successfully completed, and how efficient is the ride fulfillment process?

- How much revenue is generated from completed rides, and how does it trend over time?

- Which payment methods contribute the most to total revenue, and is there over-dependence on specific modes?

- Which vehicle types generate the highest revenue, and how does their performance compare in terms of ride volume?

- Who are the top customers contributing to ride frequency, and how concentrated is the demand?

- What is the average ride distance, and what does it indicate about customer travel patterns?

- What is the overall customer satisfaction level based on ratings, and does it indicate stable service quality?


---

## Key Insights


- The ride success rate is **~62%**, meaning nearly **38% of bookings do not convert into completed rides**, indicating a significant gap in operational efficiency.

- Total revenue stands at **~39.03M**, but this reflects only completed rides, suggesting that a substantial portion of potential revenue is lost due to unsuccessful bookings.

- Revenue is heavily concentrated in **Cash and UPI payments**, indicating a strong dependency on these methods and low diversification in payment channels.

- Certain vehicle types generate **higher revenue with comparable ride volumes**, highlighting differences in pricing and customer preference across categories.

- A small group of customers appears repeatedly in the top bookings, suggesting **customer concentration**, where a limited segment drives a significant share of demand.

- The average ride distance of **~14.21 km** indicates a balanced mix of short and medium-distance trips, reflecting typical urban mobility patterns.

- Customer ratings average around **4.0**, indicating stable but not exceptional service quality, leaving room for improvement in customer experience.

---

## Business Impact

The low ride success rate (62.1%) results in substantial revenue leakage, where a large share of potential bookings does not translate into actual revenue.

Operational inefficiencies such as high cancellation rates and longer wait times directly affect:

- Revenue growth
- Customer satisfaction
- Platform reliability

Additionally:

- Heavy reliance on Cash and UPI indicates limited payment diversification
- A small group of customers contributes disproportionately to bookings, creating demand concentration risk

If not addressed, these issues can lead to:

- Reduced customer retention
- Lower driver utilization efficiency
- Missed revenue opportunities despite strong demand

---

## Business Recommendations

- **Improve ride completion rate:**  
  Focus on reducing the ~38% failure rate by optimizing driver allocation and minimizing delays in ride acceptance.

- **Reduce revenue leakage:**  
  Convert more bookings into successful rides by addressing cancellation causes identified in SQL analysis.

- **Diversify payment methods:**  
  Promote card and wallet usage through targeted incentives to reduce over-dependence on cash and UPI.

- **Optimize vehicle supply strategy:**  
  Increase availability of high-performing vehicle types that generate higher revenue to maximize earnings.

- **Strengthen customer retention:**  
  Introduce loyalty programs for high-frequency users who contribute significantly to booking volume.

- **Enhance long-distance ride incentives:**  
  Provide driver incentives for longer trips to ensure availability and reduce cancellation probability for high-value rides.

- **Enhance customer experience:**  
  Improve service quality to push ratings beyond 4.0 by reducing wait times and ensuring ride reliability.

---

## Conclusion 

This analysis highlights that the primary challenge in ride-hailing operations is not demand generation, but inefficient conversion of bookings into successful rides.

While the platform generates 39.03M in revenue, a significant portion of potential earnings is lost due to cancellations and incomplete rides.

The study demonstrates that:

- Operational efficiency (TAT, driver availability) is a key driver of performance
- Customer experience (wait time, reliability) directly impacts ride success
- Revenue growth can be achieved by fixing internal inefficiencies rather than external expansion

Addressing these gaps can significantly improve both profitability and customer satisfaction.

---  

Next Steps / Future Analysis

To further enhance decision-making and operational performance, the following analyses are recommended:

1. Cancellation Driver Analysis (Deep Dive)
- Identify exact causes of cancellations using time, location, and wait-time segmentation
- Quantify impact of C_TAT and V_TAT on ride failure probability

2. Demand-Supply Gap Analysis
- Compare booking demand vs driver availability
- Identify peak-hour shortages and high-failure zones
  
3. Location-Based Performance Analysis
- Analyze pickup/drop hotspots with high cancellation rates
- Enable targeted operational improvements in critical areas
  
4. Customer Segmentation & Retention
- Segment users into: High-frequency, Occasional and At-risk customers
- Evaluate how cancellations impact repeat usage

5. Pricing & Incentive Optimization
- Analyze whether:
   -Longer rides face higher cancellations
   -Certain vehicle types underperform due to pricing mismatch
  
- Recommend dynamic pricing or driver incentives
  
6. Driver Performance & Reliability Analysis
-Track driver-level metrics:
   - Cancellation frequency
   - Ratings
   - Ride completion rate
- Identify and manage low-performing drivers

---

## Tools Used

- Excel (Data Source & Preparation)

- My SQL (Data Analysis & Querying)

- Power BI (Dashboard & Visualization)

---

## Skills Demonstrated

- Data Cleaning and Preparation

- KPI Development

- DAX Calculations

- Data Visualization and Dashboard Design

- Business Insight Generation

- Analytical Thinking and Problem Solving

---

## SQL Skills Demonstrated

- Data filtering and aggregation
- Group By and sorting techniques
- Business query writing
- Analytical thinking using SQL

---

## Data Workflow

1. Excel Dataset
2. SQL Analysis
3. Data Exploration
4. Power BI Dashboard
5. Insights & Recommendations

---

## Project Structure

ola-ride-performance-analysis/

├── data/
│   └── ola_ride_operations_dataset.xlsx       
├── sql/
│   └── business_analysis.sql                  

├── powerbi/
│   └── ola_ride_performance_dashboard.pbix     

├── dashboard_images/
│   ├── ola_dashboard_overview.png             
│   └── ola_dataset_preview.png                 
└── README.md                                   

---

## Repository Structure

- **data** - ola_ride_operations_dataset.xlsx
  - Contains raw and processed datasets used for analysis

- **sql** - business_analysis.sql
  - Includes SQL scripts for database creation and business analysis

- **powerbi** - ola_ride_performance_dashboard.pbix
  - Contains the Power BI dashboard file (.pbix)

- **dashboard_images** - ola_dashboard_overview.png
  - Stores screenshots used in the README for visualization preview

- **README.md**
  - Complete project documentation and insights
  
---

## How to Use

1. Download the dataset from the dataset folder

2. Run SQL queries from sql/business_analysis.sql

3. Open the Power BI file to explore the dashboard

4. Use filters to analyze trends across vehicle types and booking status

5. Review insights and recommendations for business understanding


---

## Author

**Sarvesh Vernekar**

Aspiring Data Analyst focused on transforming business data into actionable insights through analytics, visualization, and data-driven decision making.
