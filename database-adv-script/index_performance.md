# Measure Performance (Before & After)
## Use **`EXPLAIN`** or **`EXPLAIN ANALYZE`** in PostgreSQL (or **`EXPLAIN`** in MySQL):

<pre lang="sql">
```EXPLAIN ANALYZE
SELECT
  Users.name,
  Properties.name,
  Bookings.created_at
FROM
  Bookings
JOIN Users ON Users.user_id = Bookings.user_id
JOIN Properties ON Properties.property_id = Bookings.property_id
WHERE
  Properties.location = 'Addis Ababa'
ORDER BY
  Bookings.created_at DESC;```</pre>