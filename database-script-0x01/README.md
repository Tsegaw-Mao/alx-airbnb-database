# 🗃️ Database Schema: Tables and Constraints

This document describes the entities, attributes, constraints, and indexing strategy for the normalized relational database schema of the property booking system.

---

## Users Table

| Attribute       | Type    | Constraints                            |
|-----------------|---------|----------------------------------------|
| user_id         | UUID    | Primary Key, Indexed                   |
| first_name      | VARCHAR | NOT NULL                               |
| last_name       | VARCHAR | NOT NULL                               |
| email           | VARCHAR | UNIQUE, NOT NULL, Indexed              |
| password_hash   | VARCHAR | NOT NULL                               |
| phone_number    | VARCHAR | NULL                                   |
| role            | ENUM    | NOT NULL (`guest`, `host`, `admin`)    |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |

### Constraints
- **Primary Key**: `user_id`
- **Unique**: `email`
- **Check**: `role` must be one of `'guest'`, `'host'`, `'admin'`
- **NOT NULL** `first_name`, `last_name`, `email`, `password_hash`, and `role` must not be 'NULL'

---

## Properties Table

| Attribute       | Type    | Constraints                            |
|-----------------|---------|----------------------------------------|
| property_id     | UUID    | Primary Key, Indexed                   |
| host_id         | UUID    | Foreign Key → Users(user_id), NOT NULL |
| name            | VARCHAR | NOT NULL                               |
| description     | TEXT    | NOT NULL                               |
| location        | VARCHAR | NOT NULL                               |
| pricepernight   | DECIMAL | NOT NULL                               |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |
| updated_at      | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP          |

### Constraints
- **Primary Key**: `property_id`
- **Foreign Key**: `host_id` references `users(user_id)`
- **NOT NULL** `host_id`, `name`, `description`, `location`, and `pricepernight` must not be 'NULL'

---

## Bookings Table

| Attribute       | Type    | Constraints                            |
|-----------------|---------|----------------------------------------|
| booking_id      | UUID    | Primary Key, Indexed                   |
| property_id     | UUID    | Foreign Key → Properties(property_id)  |
| user_id         | UUID    | Foreign Key → Users(user_id)           |
| start_date      | DATE    | NOT NULL                               |
| end_date        | DATE    | NOT NULL                               |
| total_price     | DECIMAL | NOT NULL                               |
| status          | ENUM    | NOT NULL (`pending`, `confirmed`, `canceled`) |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |

### Constraints
- **Primary Key**: `booking_id`
- **Foreign Keys**:
  - `property_id` → `properties(property_id)`
  - `user_id` → `users(user_id)`
- **Check**: `status` must be `'pending'`, `'confirmed'`, or `'canceled'`

---

## Payments Table

| Attribute       | Type    | Constraints                            |
|-----------------|---------|----------------------------------------|
| payment_id      | UUID    | Primary Key, Indexed                   |
| booking_id      | UUID    | Foreign Key → Bookings(booking_id)     |
| amount          | DECIMAL | NOT NULL                               |
| payment_date    | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |
| payment_method  | ENUM    | NOT NULL (`credit_card`, `paypal`, `stripe`) |

### Constraints
- **Primary Key**: `payment_id`
- **Foreign Key**: `booking_id` → `bookings(booking_id)`
- **Check**: `payment_method` must be one of `'credit_card'`, `'paypal'`, `'stripe'`

---

## Reviews Table

| Attribute       | Type    | Constraints                            |
|-----------------|---------|----------------------------------------|
| review_id       | UUID    | Primary Key, Indexed                   |
| property_id     | UUID    | Foreign Key → Properties(property_id)  |
| user_id         | UUID    | Foreign Key → Users(user_id)           |
| rating          | INTEGER | NOT NULL, CHECK: 1 ≤ rating ≤ 5        |
| comment         | TEXT    | NOT NULL                               |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |

### Constraints
- **Primary Key**: `review_id`
- **Foreign Keys**:
  - `property_id` → `properties(property_id)`
  - `user_id` → `users(user_id)`
- **Check**: `rating` must be between 1 and 5

---

## Messages Table

| Attribute       | Type    | Constraints                            |
|-----------------|---------|----------------------------------------|
| message_id      | UUID    | Primary Key, Indexed                   |
| sender_id       | UUID    | Foreign Key → Users(user_id)           |
| recipient_id    | UUID    | Foreign Key → Users(user_id)           |
| message_body    | TEXT    | NOT NULL                               |
| sent_at         | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |

### Constraints
- **Primary Key**: `message_id`
- **Foreign Keys**:
  - `sender_id` → `users(user_id)`
  - `recipient_id` → `users(user_id)`

---

## Additional Indexing

| Table      | Indexed Columns                        |
|------------|----------------------------------------|
| Users      | `user_id`, `email`                     |
| Properties | `property_id`                          |
| Bookings   | `booking_id`, `property_id`            |
| Payments   | `payment_id`, `booking_id`             |
| Reviews    | `review_id`                            |
| Messages   | `message_id`                           |

---
