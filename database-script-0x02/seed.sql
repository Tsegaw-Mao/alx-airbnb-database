-- Sample data for Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('U-000001', 'Abera', 'Wasyihun', 'aberawasyihun@example.com', 'hash1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('U-000002', 'Bob', 'Johnson', 'bob@example.com', 'hash2', '2345678901', 'host', CURRENT_TIMESTAMP),
('U-000003', 'Carol', 'Williams', 'carol@example.com', 'hash3', '3456789012', 'guest', CURRENT_TIMESTAMP),
('U-000004', 'Tesema', 'Abiy', 'tesema@example.com', 'hash2', '1425369870', 'host', CURRENT_TIMESTAMP);

-- Sample data for Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('P-000001', 'U-000002', 'Cozy Apartment', 'A nice and cozy apartment in the city center.', 'Addis Ababa', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('P-000002', 'U-000004', 'Beach House', 'A beautiful house by the beach.', 'Bishoftu', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample data for Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('B-000001', 'P-000001', 'U-000001', '2025-07-01', '2025-07-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
('B-000002', 'P-000002', 'U-000003', '2025-08-10', '2025-08-15', 1250.00, 'pending', CURRENT_TIMESTAMP);

-- Sample data for Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('C-000001', 'B-000001', 480.00, CURRENT_TIMESTAMP, 'credit_card'),
('C-000002', 'B-000002', 1250.00, CURRENT_TIMESTAMP, 'paypal');

-- Sample data for Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('R-000001', 'P-000001', 'U-000001', 5, 'Great place, very clean!', CURRENT_TIMESTAMP),
('R-000002', 'P-000002', 'U-000003', 4, 'Amazing view, will come again.', CURRENT_TIMESTAMP);

-- Sample data for Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('M-000000-000000-000001', 'U-000001', 'U-000002', 'Hi, is the apartment available for early check-in?', CURRENT_TIMESTAMP),
('M-000000-000000-000002', 'U-000003', 'U-000004', 'Yes, early check-in is possible.', CURRENT_TIMESTAMP),
('M-000000-000000-000003', 'U-000004', 'U-000003', 'Hi Carol, yes, you can check in from 10am.', CURRENT_TIMESTAMP);