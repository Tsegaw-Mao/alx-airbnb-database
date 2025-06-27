-- Enum types (PostgreSQL syntax)
CREATE TYPE role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

-- Users table
CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_users_email ON Users(email);

-- Properties table
CREATE TABLE Properties (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL REFERENCES Users(user_id),
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE INDEX idx_properties_property_id ON Properties(property_id);

-- Bookings table
CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Properties(property_id),
    user_id UUID NOT NULL REFERENCES Users(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_bookings_booking_id ON Bookings(booking_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Payments table
CREATE TABLE Payments (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL REFERENCES Bookings(booking_id),
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_method NOT NULL
);

CREATE INDEX idx_payments_payment_id ON Payments(payment_id);
CREATE INDEX idx_payments_booking_id ON Payments(booking_id);

-- Reviews table
CREATE TABLE Reviews (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Properties(property_id),
    user_id UUID NOT NULL REFERENCES Users(user_id),
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_reviews_review_id ON Reviews(review_id);

-- Messages table
CREATE TABLE Messages (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL REFERENCES Users(user_id),
    recipient_id UUID NOT NULL REFERENCES Users(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_messages_message_id ON Messages(message_id);
