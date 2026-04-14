Select * from ola_ride_operations

#1.	Retrieve all successful bookings:
Select * from ola_ride_operations
where Booking_Status = 'Success';


#2.	Find the average ride distance for each vehicle type:
Select Vehicle_Type, AVG(Ride_Distance) as avg_distance
from ola_ride_operations
Group By Vehicle_Type;


#3.	Get the total number of cancelled rides by the customers:
Select count(*) from ola_ride_operations
Where Booking_Status = 'canceled by customer';


#4.	List the top 5 customers who booked the highest number of rides:
Select Customer_Id, count(Booking_Id) As Total_Rides
From ola_ride_operations
Group By Customer_Id
Order By Total_Rides Desc Limit 5;


#5.	Get the number of rides cancelled by drivers due to personal and car-related issues:
Select Count(*) From ola_ride_operations
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';


#6.	Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select Max(Driver_Ratings) As Max_Driver_Rating,
Min(Driver_Ratings) As Min_Driver_Rating
From ola_ride_operations
Where Vehicle_Type = 'Prime Sedan';


#7.	Retrieve all rides where payment was made using UPI:
Select * from ola_ride_operations
Where Payment_Method = 'UPI';


#8.	Find the average customer rating per vehicle type:
Select Vehicle_Type, Avg(Customer_Rating) As Avg_Customer_Rating
From ola_ride_operations
Group By Vehicle_Type;


#9.	Calculate the total bookings value of rides completed successfully:
Select Sum(Booking_Value) As Total_Booking_Value
From ola_ride_operations
Where Booking_Status = 'Success';


#10.	List all incomplete rides along with the reason:
Select Booking_ID, Incomplete_Rides_Reason
From ola_ride_operations
Where Incomplete_Rides = 'YES';


#11.    C_TAT Analysis: Wait Time vs Ride Failure
SELECT 
    CASE 
        WHEN C_TAT/60 < 5 THEN '0-5 mins'
        WHEN C_TAT/60 < 10 THEN '5-10 mins'
        ELSE '10+ mins'
    END AS wait_time_bucket,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN Booking_Status != 'Success' THEN 1 ELSE 0 END) AS failed_rides,
    ROUND(
        SUM(CASE WHEN Booking_Status != 'Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_percentage
FROM ola_ride_operations
GROUP BY wait_time_bucket;