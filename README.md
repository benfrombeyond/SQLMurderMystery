# SQL Murder Mystery — Investigation Writeup

## What this is
I solved the Knight Lab “SQL Murder Mystery” by querying an unfamiliar relational database.

## What I practiced
- Exploring an unknown schema
- Filtering and joining across tables to connect entities
- Iterative hypothesis testing
- Validating assumptions (row counts, uniqueness, join behavior)

## Approach (high level)
1. Started from the reported crime details (date/location).
2. Pulled witness statements and extracted constraints.
3. Joined person/vehicle/membership/event records to narrow suspects.
4. Confirmed the final candidate matched every constraint.

## Files
- `queries.sql` — key queries used during the investigation (commented)
