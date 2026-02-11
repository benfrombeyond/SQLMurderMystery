# SQL Murder Mystery — Investigation Writeup

## What this is
I solved the Knight Lab “SQL Murder Mystery” by querying an unfamiliar relational database.

## What I practiced
- Multi-table joins across normalized schema
- Filtering from natural-language requirements
- Iterative narrowing of candidate sets
- Logical validation / avoiding join-grain mistakes

## Approach (high level)
1. Started from the reported crime details (date/location).
2. Pulled witness statements and extracted constraints.
3. Joined person/vehicle/membership/event records to narrow suspects.
4. Confirmed the final candidate matched every constraint.

## Files
- `queries.sql` — key queries used during the investigation (commented)
