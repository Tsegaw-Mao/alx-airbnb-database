-- Indexes for Users
CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_users_email ON Users(email);

-- Indexes for Bookings
CREATE INDEX idx_bookings_booking_id ON Bookings(booking_id);
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_created_at ON Bookings(created_at);

-- Indexes for Properties
CREATE INDEX idx_properties_property_id ON Properties(property_id);
CREATE INDEX idx_properties_location ON Properties(location);

-- create Performace measurement indexes
EXPLAIN ANALYZE
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
  Bookings.created_at DESC;
