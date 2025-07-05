Partitioning Report: Bookings Table
 Goal
Improve performance on large Bookings table by partitioning based on check_in_date.

 Implementation
Partitioned Bookings table by quarterly date ranges.

Created child tables Bookings_2025_Q1 to Bookings_2025_Q4.

Added indexes on user_id in each partition.

 Performance Test
Query tested:

sql
Copy
Edit
SELECT * FROM Bookings WHERE check_in_date BETWEEN '2025-07-01' AND '2025-07-31';
Test Type	Execution Plan	Estimated Cost
Before Partition	Seq Scan on Bookings	High
After Partition	Index Scan on Q3 Partition	Low