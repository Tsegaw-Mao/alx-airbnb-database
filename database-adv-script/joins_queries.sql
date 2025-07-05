SELECT
    Bookings.booking_id,
    Bookings.property_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Bookings.status,
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email
FROM
    Bookings
INNER JOIN
    Users ON Bookings.user_id = Users.user_id;


SELECT
    Properties.property_id,
    Properties.host_id,
    Properties.user_id,
    Properties.name,
    Properties.description,
    Properties.location,
    Properties.pricepernight,
    Reviews.comment,
    Reviews.rating
FROM
    Properties
LEFT JOIN
    Reviews ON Properties.property_id = Reviews.property_id;
ORDER BY
    Reviews.rating DESC NULLS LAST;

SELECT
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Users.phone_number,
    Bookings.booking_id,
    Bookings.start_date,
    Bookings.end_date,
    Bookings.total_price,
    Bookings.status,
    Bookings.user_id AS booking_user_id,
FROM
    Users
FULL OUTER JOIN
    Bookings ON Users.user_id = Bookings.user_id
WHERE
    Users.role = 'guest';