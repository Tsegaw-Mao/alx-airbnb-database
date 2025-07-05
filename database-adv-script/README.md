# Advanced Querying Power
---
### Complex Queries with Joins.
 - a query using an **`INNER JOIN`** to retrieve all bookings and the respective users who made those bookings.
 - a query using a **`LEFT JOIN`** to retrieve all properties and their reviews, including properties that have no reviews. In Order From high ratings to the lowest('NULL')
 - a query using a **`FULL OUTER JOIN`** to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
 ---
 ### Subqueries
 - a query to find all properties where the average rating is greater than 4.0 using a **`subquery`**.
 - a **`correlated subquery`** to find users who have made more than 3 bookings.
 ### Aggregations and Window Functions
 - a query to find the total number of bookings made by each user, using the **`COUNT`** function and **`GROUP BY`** clause.
 - a window function (**`ROW_NUMBER`**, **`RANK`**) to rank properties based on the total number of bookings they have received.