SELECT
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Users.phone_number,
    COUNT(Bookings.booking_id) AS total_bookings
FROM
    Users
LEFT JOIN
    Bookings ON Users.user_id = Bookings.user_id
GROUP BY
    Users.user_id, Users.first_name, Users.last_name, Users.email, Users.phone_number

SELECT
    Properties.property_id,
    Properties.name,
    Properties.location,
    COUNT(Bookings.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Bookings.booking_id) DESC) AS Properties_rank
FROM
    Properties
LEFT JOIN
    Bookings ON Properties.property_id = Bookings.property_id
GROUP BY
    Properties.property_id, Properties.name, Properties.location