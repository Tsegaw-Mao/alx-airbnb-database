-- Drop existing table if needed
DROP TABLE IF EXISTS Bookings CASCADE;

-- Create parent Bookings table with partitioning
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (check_in_date);

-- Partition 1: Jan–Mar 2025
CREATE TABLE Bookings_2025_Q1 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

-- Partition 2: Apr–Jun 2025
CREATE TABLE Bookings_2025_Q2 PARTITION OF Bookings
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

-- Partition 3: Jul–Sep 2025
CREATE TABLE Bookings_2025_Q3 PARTITION OF Bookings
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

-- Partition 4: Oct–Dec 2025
CREATE TABLE Bookings_2025_Q4 PARTITION OF Bookings
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Optional: Create indexes on each partition
CREATE INDEX idx_bookings_q1_user_id ON Bookings_2025_Q1(user_id);
CREATE INDEX idx_bookings_q2_user_id ON Bookings_2025_Q2(user_id);
CREATE INDEX idx_bookings_q3_user_id ON Bookings_2025_Q3(user_id);
CREATE INDEX idx_bookings_q4_user_id ON Bookings_2025_Q4(user_id);

EXPLAIN ANALYZE
SELECT * FROM Bookings
WHERE check_in_date BETWEEN '2025-07-01' AND '2025-07-31';

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (check_in_date);


EXPLAIN ANALYZE
SELECT * FROM Bookings
WHERE check_in_date BETWEEN '2025-07-01' AND '2025-07-31';

