-- Retrieve all bookings with user, property, and payment details
SELECT
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM
    Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id;
WHERE
    p.location = 'Addis Ababa' AND p.pricepernight < 200.00


EXPLAIN ANALYZE
-- Paste the same query here without the comment
SELECT
    b.booking_id,
    b.booking_date,
    b.check_in_date,
    b.check_out_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM
    Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id;
WHERE
    p.location = 'Addis Ababa' AND p.pricepernight < 200.00
