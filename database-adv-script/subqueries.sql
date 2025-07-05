SELECT
    property_id,
    name,
    description,
    location,
    pricepernight
FROM
    Properties
WHERE
    property_id IN (
        SELECT
            property_id
        FROM
            Reviews
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );
SELECT
    user_id,
    first_name,
    last_name,
    email
FROM
    Users
WHERE
    user_id IN (
        SELECT COUNT(*)
        FROM
            Bookings
        WHERE
            Users.user_id = Bookings.user_id
    ) > 3;