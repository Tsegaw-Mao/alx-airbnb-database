-- COUNT function and GROUP BY  --
SELECT
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Users.phone_number,
    COUNT(Bookings.booking_id) AS total_bookings
FROM
    Users
    LEFT JOIN Bookings ON Users.user_id = Bookings.user_id
GROUP BY
    Users.user_id,
    Users.first_name,
    Users.last_name,
    Users.email,
    Users.phone_number

-- Window functions: RANK and ROW_NUMBER  --
SELECT
    ROW_NUMBER() OVER (
        ORDER BY
            total_bookings DESC
    ) AS Property_Num, -- 1, 2, 3 for row numbering of properties
    property_id, -- property ID
    name, -- property name
    location, -- property location
    total_bookings, -- total bookings for the property
    RANK() OVER (
        ORDER BY
            total_bookings DESC
    ) AS Properties_rank -- rank based on total bookings
FROM
    (
        -- Inner query: total bookings per property
        SELECT
            Properties.property_id, -- property ID
            Properties.name, -- property name       
            Properties.location, -- property location   
            COUNT(Bookings.booking_id) AS total_bookings
        FROM
            Properties
            LEFT JOIN Bookings ON Properties.property_id = Bookings.property_id
        GROUP BY
            Properties.property_id,
            Properties.name,
            Properties.location
    ) AS ranked_properties;