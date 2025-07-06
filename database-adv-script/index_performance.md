# Index Performance

## Overview
Indexes play a critical role in speeding up database queries. This document outlines the indexing strategy, evaluation, and improvements made.

## Strategy
- **B-tree indexes** on:
  - Primary keys (e.g., `user_id`, `listing_id`)
  - Foreign keys (e.g., `user_id` in reviews table)
  - Filter/search fields (e.g., `city`, `price`, `availability_date`)

- **Composite Indexes** for multi-column WHERE clauses:
  ```sql
  CREATE INDEX idx_city_price ON listings (city, price);
