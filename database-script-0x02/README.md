# Sample Data (Seed)

## Below is example of sample data reflecting real-world to be seeded to the system

### Users

| user_id   | first_name | last_name | email                     | phone_number  | role  |
|-----------|------------|-----------|---------------------------|--------------|-------|
| U-000001  | Abera      | Wasyihun  | aberawasyihun@example.com | 1234567890   | guest |
| U-000002  | Amina      | Mwangi    | amina@example.com           | 2345678901   | host  |
| U-000003  | Tewdros    | Kassa     | tewdros@example.com         | 3456789012   | guest |
| U-000004  | Tesema     | Abiy      | tesema@example.com        | 1425369870   | host  |

### Properties

| property_id | host_id   | name           | description                                 | location      | pricepernight |
|-------------|-----------|----------------|---------------------------------------------|--------------|--------------|
| P-000001    | U-000002  | Cozy Apartment | A nice and cozy apartment in the city center.| Addis Ababa  | 120.00       |
| P-000002    | U-000004  | Beach House    | A beautiful house by the beach.              | Bishoftu     | 250.00       |

### Bookings

| booking_id | property_id | user_id   | start_date  | end_date    | total_price | status    |
|------------|-------------|-----------|-------------|-------------|-------------|-----------|
| B-000001   | P-000001    | U-000001  | 2025-07-01  | 2025-07-05  | 480.00      | confirmed |
| B-000002   | P-000002    | U-000003  | 2025-08-10  | 2025-08-15  | 1250.00     | pending   |

### Payments

| payment_id | booking_id | amount  | payment_method |
|------------|------------|---------|---------------|
| C-000001   | B-000001   | 480.00  | credit_card   |
| C-000002   | B-000002   | 1250.00 | paypal        |

### Reviews

| review_id  | property_id | user_id   | rating | comment                        |
|------------|-------------|-----------|--------|--------------------------------|
| R-000001   | P-000001    | U-000001  | 5      | Great place, very clean!       |
| R-000002   | P-000002    | U-000003  | 4      | Amazing view, will come again. |

### Messages

| message_id              | sender_id  | recipient_id | message_body                                   |
|-------------------------|------------|--------------|------------------------------------------------|
| M-000000-000000-000001  | U-000001   | U-000002     | Hi, is the apartment available for early check-in? |
| M-000000-000000-000002  | U-000003   | U-000004     | Yes, early check-in is possible.               |
| M-000000-000000-000003  | U-000004   | U-000003     | Hi Tewdros, yes, you can check