#### You can find the visual reperesentation of the ER diagram at : https://dbdiagram.io/d/relationships-685eeff7f413ba35083f7ac1

# Database Entities and Relationships

This document defines the entities, their attributes, and the relationships in the System.

---

## Entity: User

Represents all users of the platform including guests, hosts, and admins.

### Attributes
- `user_id` (UUID, Primary Key)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Entity: Property

Represents properties listed by hosts.

### Attributes
- `property_id` (UUID, Primary Key)
- `host_id` (UUID, Foreign Key → User.user_id)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

## Entity: Booking

Represents a booking made by a user for a property.

### Attributes
- `booking_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property.property_id)
- `user_id` (UUID, Foreign Key → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Entity: Payment

Represents payment information linked to a booking.

### Attributes
- `payment_id` (UUID, Primary Key)
- `booking_id` (UUID, Foreign Key → Booking.booking_id)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)

---

## Entity: Review

Represents user reviews for a property.

### Attributes
- `review_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property.property_id)
- `user_id` (UUID, Foreign Key → User.user_id)
- `rating` (INTEGER, CHECK: 1 ≤ rating ≤ 5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Entity: Message

Represents direct messages between users.

### Attributes
- `message_id` (UUID, Primary Key)
- `sender_id` (UUID, Foreign Key → User.user_id)
- `recipient_id` (UUID, Foreign Key → User.user_id)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

# Entity Relationships

### User ↔ Booking
- One user **can make many** bookings.
- One booking is **made by one** user.
- **Type**: One-to-Many (`User.user_id` → `Booking.user_id`)

### User (host) ↔ Property
- One host **can list many** properties.
- One property **belongs to one** host.
- **Type**: One-to-Many (`User.user_id` → `Property.host_id`)

### Property ↔ Booking
- One property **can be booked many times**.
- One booking is **for one property**.
- **Type**: One-to-Many (`Property.property_id` → `Booking.property_id`)

### Booking ↔ Payment
- One booking **can have one or more** payments (though usually one).
- Each payment is **linked to one** booking.
- **Type**: One-to-One or One-to-Many (`Booking.booking_id` → `Payment.booking_id`)

### User ↔ Review ↔ Property
- A user **can write many** reviews.
- A property **can have many** reviews.
- Each review **belongs to one user** and **one property**.
- **Type**: Many-to-Many (resolved through the `Review` table)

### User ↔ Message ↔ User
- Users **can send and receive messages** to/from other users.
- **Type**: Many-to-Many (self-join via `Message` table)


