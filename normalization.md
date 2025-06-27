# Normalization Steps for Airbnb Database Schema

## 1. First Normal Form (1NF)
- **Requirement:** Each table must have atomic (indivisible) values and each record must be unique.
- **How Satisfied:**  
  - All columns contain atomic values (e.g., no lists or sets).
  - Each table has a primary key ensuring uniqueness.

## 2. Second Normal Form (2NF)
- **Requirement:** The table must be in 1NF and all non-key attributes must be fully functionally dependent on the entire primary key.
- **How Satisfied:**  
  - All tables use a single-column primary key (no composite keys).
  - All non-key attributes depend on the primary key of their table.

## 3. Third Normal Form (3NF)
- **Requirement:** The table must be in 2NF and all attributes must be directly dependent on the primary key (no transitive dependencies).
- **How Satisfied:**  
  - No non-key attribute depends on another non-key attribute.
  - All non-key attributes depend only on the primary key.

## Notes
- The `Enums` (`role`, `booking_status`, `payment_method`) are used for fixed sets of values and do not violate normalization since the sets are not expected to grow.
- No redundant data or transitive dependencies were found in the schema.

## Conclusion
The current schema is in **Third Normal Form (3NF)** and is well-structured for the intended Purpose