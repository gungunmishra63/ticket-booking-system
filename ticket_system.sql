CREATE DATABASE ticket_system;
USE ticket_system;

-- USERS
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- SHOWS
CREATE TABLE shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    show_name VARCHAR(100),
    show_time DATETIME
);

-- SEATS
CREATE TABLE seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT,
    status VARCHAR(20) DEFAULT 'AVAILABLE',
    lock_time DATETIME,
    version INT DEFAULT 1,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

-- BOOKINGS
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    seat_id INT,
    booking_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);

INSERT INTO users (name, email)
VALUES ('Gungun', 'gungun@gmail.com');

INSERT INTO shows (show_name, show_time)
VALUES ('Avengers', '2026-06-01 18:00:00');

INSERT INTO seats (show_id)
VALUES (1),(1),(1),(1),(1),(1),(1),(1);

SELECT * FROM seats;

START TRANSACTION;

SELECT * FROM seats
WHERE seat_id = 1
FOR UPDATE;

UPDATE seats
SET status = 'BOOKED',
    lock_time = NOW()
WHERE seat_id = 1;

COMMIT;

SELECT * FROM seats;

SELECT * FROM seats
WHERE status = 'AVAILABLE'
FOR UPDATE SKIP LOCKED;

UPDATE seats
SET status = 'AVAILABLE'
WHERE lock_time < NOW() - INTERVAL 2 MINUTE;