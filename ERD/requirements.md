Enum role {
  guest
  host
  admin
}

Enum booking_status {
  pending
  confirmed
  canceled
}

Enum payment_method {
  credit_card
  paypal
  stripe
}

Table users {
  user_id        uuid    [pk, unique, note: 'Primary Key, Indexed']
  first_name     varchar [not null]
  last_name      varchar [not null]
  email          varchar [not null, unique, note: 'Indexed']
  password_hash  varchar [not null]
  phone_number   varchar
  role           role    [not null]
  created_at     timestamp [default: `CURRENT_TIMESTAMP`]

  Note: 'User table with roles and unique emails'
}

Table properties {
  property_id     uuid    [pk, unique, note: 'Primary Key, Indexed']
  host_id         uuid    [ref: > users.user_id, not null]
  name            varchar [not null]
  description     text    [not null]
  location        varchar [not null]
  pricepernight   decimal [not null]
  created_at      timestamp [default: `CURRENT_TIMESTAMP`]
  updated_at      timestamp [note: 'ON UPDATE CURRENT_TIMESTAMP']

  Note: 'Properties listed by hosts'
}

Table bookings {
  booking_id   uuid    [pk, unique, note: 'Primary Key, Indexed']
  property_id  uuid    [ref: > properties.property_id, not null, note: 'Indexed']
  user_id      uuid    [ref: > users.user_id, not null]
  start_date   date    [not null]
  end_date     date    [not null]
  total_price  decimal [not null]
  status       booking_status [not null]
  created_at   timestamp [default: `CURRENT_TIMESTAMP`]

  Note: 'Tracks booking details and status'
}

Table payments {
  payment_id     uuid    [pk, unique, note: 'Primary Key, Indexed']
  booking_id     uuid    [ref: > bookings.booking_id, not null, note: 'Indexed']
  amount         decimal [not null]
  payment_date   timestamp [default: `CURRENT_TIMESTAMP`]
  payment_method payment_method [not null]

  Note: 'Payments linked to bookings'
}

Table reviews {
  review_id   uuid    [pk, unique, note: 'Primary Key, Indexed']
  property_id uuid    [ref: > properties.property_id, not null]
  user_id     uuid    [ref: > users.user_id, not null]
  rating      integer [not null, note: 'Value must be between 1 and 5']
  comment     text    [not null]
  created_at  timestamp [default: `CURRENT_TIMESTAMP`]

  Note: 'User reviews for properties'
}

Table messages {
  message_id     uuid    [pk, unique, note: 'Primary Key, Indexed']
  sender_id      uuid    [ref: > users.user_id, not null]
  recipient_id   uuid    [ref: > users.user_id, not null]
  message_body   text    [not null]
  sent_at        timestamp [default: `CURRENT_TIMESTAMP`]

  Note: 'Direct messages between users'
}
