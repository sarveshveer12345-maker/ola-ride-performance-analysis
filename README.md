# OLA Ride Performance Analysis | SQL + Power BI

## Project Overview

This project analyzes ride-hailing data to evaluate booking performance, revenue generation, cancellation behavior, and customer usage patterns.

Using SQL, key business queries were performed to extract insights such as successful bookings, ride distance trends, cancellation counts, and top customers. These insights were then visualized in Power BI through an interactive dashboard to monitor ride efficiency, revenue distribution, and operational performance.

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


---

## Dataset Information


## 📘 Data Dictionary

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
