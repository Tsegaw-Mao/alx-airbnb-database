# Partition Performance

## Overview
Partitioning is used in the database to improve query performance and manage large datasets more efficiently.

## Strategy
We use **Range Partitioning** based on the `created_at` timestamp column for time-based queries (e.g., user activity logs).

### Example:
```sql
PARTITION BY RANGE (YEAR(created_at))
```
### Benefits Observed
* Query Speed: 3–5x faster retrieval of time-scoped data.

* Maintenance: Easier data archiving and purging of old records.

* Concurrency: Reduced lock contention on large tables.

### Limitations
* Increased complexity in writing raw queries (partition-aware).

* Certain operations (e.g., foreign key constraints) are limited with partitioned tables.

### Next Steps
* Evaluate Hash Partitioning for large, evenly distributed user-related tables.
 
* Automate monthly partition creation and deletion via scheduled tasks.
