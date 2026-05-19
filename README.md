# 🎟️ Advanced Ticket Booking System

<div align="center">

![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![SQL](https://img.shields.io/badge/Language-SQL-orange)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)
![Transactions](https://img.shields.io/badge/Feature-Transactions-red)

</div>

---

# 📌 Project Overview

The **Advanced Ticket Booking System** is a database-driven project developed using **MySQL** to simulate real-world online ticket booking operations.

This system focuses on:
- secure seat booking
- concurrency handling
- transaction management
- row-level locking

The project prevents multiple users from booking the same seat simultaneously using advanced SQL transaction concepts.

---

# 🚀 Features

✅ User Management  
✅ Show Scheduling  
✅ Seat Availability Tracking  
✅ Ticket Booking Functionality  
✅ Transaction Management  
✅ Row-Level Locking  
✅ Concurrent Booking Prevention  
✅ Automatic Seat Unlocking  
✅ Real-Time Seat Status Handling  

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| MySQL | Database Management |
| SQL | Query Language |
| Transactions | Data Consistency |
| FOR UPDATE | Row-Level Locking |
| SKIP LOCKED | Concurrent Access Handling |

---

# 🗂️ Database Schema

## 👤 Users Table
Stores user details.

```sql
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);
```

---

## 🎬 Shows Table
Stores movie/show information.

```sql
CREATE TABLE shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    show_name VARCHAR(100),
    show_time DATETIME
);
```

---

## 💺 Seats Table
Tracks seat status and locking mechanism.

```sql
CREATE TABLE seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT,
    status VARCHAR(20) DEFAULT 'AVAILABLE',
    lock_time DATETIME,
    version INT DEFAULT 1,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);
```

---

## 🎟️ Bookings Table
Stores booking transactions.

```sql
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    seat_id INT,
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);
```

---

# 🔐 Transaction Handling

The system uses SQL transactions to ensure safe booking operations.

```sql
START TRANSACTION;

SELECT * FROM seats
WHERE seat_id = 1
FOR UPDATE;

UPDATE seats
SET status = 'BOOKED',
    lock_time = NOW()
WHERE seat_id = 1;

COMMIT;
```

---

# ⚡ Concurrency Control

This project implements:
- `FOR UPDATE`
- `SKIP LOCKED`
- Row-Level Locking

to prevent:
- double booking
- race conditions
- inconsistent seat states

---

# 🔄 Seat Unlock Mechanism

Automatically releases locked seats after timeout.

```sql
UPDATE seats
SET status = 'AVAILABLE'
WHERE lock_time < NOW() - INTERVAL 2 MINUTE;
```

---

# 📊 Workflow

```text
User Selects Show
        ↓
View Available Seats
        ↓
Seat Gets Locked
        ↓
Transaction Starts
        ↓
Booking Confirmed
        ↓
Transaction Commit
```

---

# 📁 Project Structure

```text
ticket-booking-system/
│
├── ticket_system.sql
├── README.md
```

---

# 🌟 Future Enhancements

🔹 Payment Gateway Integration  
🔹 Admin Dashboard  
🔹 JDBC Connectivity with Java  
🔹 Web Frontend Integration  
🔹 Stored Procedures  
🔹 Database Triggers  
🔹 Seat Cancellation Module  
🔹 OTP-Based Booking Confirmation  

---

# 💡 Learning Outcomes

Through this project, I learned:
- Database Design
- Transaction Management
- Concurrency Control
- Real-World SQL Operations
- Relational Database Concepts

---

# 👩‍💻 Author

## Gungun Mishra

BCA Graduate | Aspiring MCA Student | Interested in AI & ML

---

# 🔗 GitHub Repository

Repository Link:  
https://github.com/gungunmishra63/ticket-booking-system

---

# ⭐ Support

If you like this project, give it a ⭐ on GitHub!
