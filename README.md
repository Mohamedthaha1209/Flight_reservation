Flight Reservation System

A SQL-based Flight Reservation System designed to manage flights, passengers, bookings, payments, and tickets. This project demonstrates database design, normalization, foreign key relationships, and the use of stored procedures for real-world operations.

---

Project Overview

This project includes:
- ✅ Normalized SQL database schema
- ⚙️ Stored Procedures for automation
- 📊 Complex SQL Queries for reports and analytics
- 💾 Sample Data (30+ entries per table)

---

## 📌 Features

- Passenger Registration & Info Storage
- Flight & Airport Management
- Flight Reservations with Seat Allocation
- Ticket Generation & Pricing
- Payment Management with Method Types
- Daily Booking Reports
- Seat Availability Checker
- Reservation Status Updates (Confirmed, Cancelled, Pending)

---

## 🧱 Database Tables

- `passenger`
- `airport`
- `flight`
- `reservation`
- `payment`
- `ticket`

Each table is connected through **foreign keys** with **cascading delete options** to maintain referential integrity.

## ⚙️ Stored Procedures

Examples of procedures used:

- `AddPassenger()`
- `BookReservation()`
- `MakePayment()`
- `IssueTicket()`
- `CheckSeatAvailability()`
## 💻 Sample Queries

```sql
-- Show total revenue per flight
SELECT f.Flight_ID, SUM(t.Price) AS revenue
FROM ticket t
JOIN reservation r ON t.Reservation_ID = r.Reservation_ID
JOIN flight f ON r.Flight_ID = f.Flight_ID
GROUP BY f.Flight_ID;

-- Show passengers without bookings
SELECT * FROM passenger
WHERE passenger_ID NOT IN (
    SELECT DISTINCT passenger_ID FROM reservation
);
