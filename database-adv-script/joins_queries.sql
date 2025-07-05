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
    Properties.name,
    Properties.description,
    Properties.location,
    Properties.pricepernight,
    Users.user_id AS host_id,
    Users.first_name AS host_first_name,
    Users.last_name AS host_last_name,
    Reviews.review_id,
    Reviews.user_id AS reviewer_id,
    Reviews.comment, AS property_review,
    Reviews.rating AS property_rating
FROM
    Properties
LEFT JOIN
    Users ON Properties.host_id = Users.user_id
LEFT JOIN
    Reviews ON Properties.property_id = Reviews.property_id

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