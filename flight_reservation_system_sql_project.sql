create database flight_reservation ;

use flight_reservation;

create table passenger(
         passenger_ID int primary key,
         Name varchar(100) not null,
         Email varchar(100) not null,
         Phone varchar(20) not null,
         gender varchar(10),
         Address text not null,
         Passport_Number char(8) unique 
);

create table airport (
		Airport_ID int primary key,
        name varchar(100),
        location varchar(100)
);

create table flight (
	    Flight_ID int primary key,
        Airline varchar(100),
        Source_Airport int,
        constraint source_airport_FK foreign key(source_Airport) references airport(Airport_ID) on delete cascade,
        Destination_Airport int ,
        constraint Destination_Airport_FK foreign key(Destination_Airport) references airport(Airport_ID) on delete cascade,
        Departure_Time time,
        Arrival_Time time,
        Duration int,
        Capacity int
);
 
create table reservation (
	    Reservation_ID int primary key,
        passenger_ID int,
        constraint passenger_ID_FK foreign key(passenger_ID) references passenger(passenger_ID) on delete cascade,
        flight_ID int,
        constraint flight_ID_FK foreign key(flight_ID) references flight (flight_ID) on delete cascade,
        Seat_Number varchar(10) unique,
        Booking_Date timestamp,
        Status ENUM('Confirmed', 'Cancelled', 'Pending')
);


create table Payment (
        Payment_ID int primary key,
        Reservation_ID int,
        constraint reservation_ID_FK foreign key(reservation_ID) references reservation(reservation_id) on delete cascade,
        Payment_Date date,
        Amount decimal(10,2),
        Payment_Method ENUM('Credit Card', 'Cash', 'PayPal', 'UPI')

);
create table Ticket (
       Ticket_ID int primary key,
       reservation_ID int,
       constraint ticket_reservation_id_FK foreign key(reservation_ID) references reservation(reservation_ID) on delete cascade,
       Issue_Date date ,
       Seat_Number varchar(10) unique,
       Price decimal(10,2)
);
-- insert datas

INSERT INTO passenger (passenger_ID, Name, Email, Phone, gender, Address, Passport_Number) VALUES
(1, 'Alice Johnson', 'alice1@example.com', '9000000001', 'Female', '123 Main St, NY', 'AA000001'),
(2, 'Bob Smith', 'bob2@example.com', '9000000002', 'Male', '456 Elm St, LA', 'AA000002'),
(3, 'Charlie Davis', 'charlie3@example.com', '9000000003', 'Male', '789 Oak St, TX', 'AA000003'),
(4, 'Dana Lee', 'dana4@example.com', '9000000004', 'Female', '321 Pine St, IL', 'AA000004'),
(5, 'Evan Stone', 'evan5@example.com', '9000000005', 'Male', '654 Maple St, FL', 'AA000005'),
(6, 'Fiona Greene', 'fiona6@example.com', '9000000006', 'Female', '213 Birch St, NV', 'AA000006'),
(7, 'George King', 'george7@example.com', '9000000007', 'Male', '654 Willow St, OR', 'AA000007'),
(8, 'Hannah Ray', 'hannah8@example.com', '9000000008', 'Female', '983 Cedar St, CA', 'AA000008'),
(9, 'Ian White', 'ian9@example.com', '9000000009', 'Male', '732 Poplar St, AZ', 'AA000009'),
(10, 'Jill Black', 'jill10@example.com', '9000000010', 'Female', '453 Fir St, CO', 'AA000010'),
(11, 'Kevin Adams', 'kevin11@example.com', '9000000011', 'Male', '923 Redwood St, GA', 'AA000011'),
(12, 'Laura Green', 'laura12@example.com', '9000000012', 'Female', '303 Ash St, PA', 'AA000012'),
(13, 'Mike Norris', 'mike13@example.com', '9000000013', 'Male', '213 Spruce St, NJ', 'AA000013'),
(14, 'Nina West', 'nina14@example.com', '9000000014', 'Female', '493 Cherry St, WA', 'AA000014'),
(15, 'Oscar Hall', 'oscar15@example.com', '9000000015', 'Male', '123 Beech St, NC', 'AA000015'),
(16, 'Paula Ross', 'paula16@example.com', '9000000016', 'Female', '651 Cedar St, VA', 'AA000016'),
(17, 'Quincy Reed', 'quincy17@example.com', '9000000017', 'Male', '837 Hickory St, MI', 'AA000017'),
(18, 'Rita Moore', 'rita18@example.com', '9000000018', 'Female', '572 Alder St, OH', 'AA000018'),
(19, 'Steve Ford', 'steve19@example.com', '9000000019', 'Male', '823 Palm St, WI', 'AA000019'),
(20, 'Tina Wells', 'tina20@example.com', '9000000020', 'Female', '391 Cypress St, MN', 'AA000020'),
(21, 'Uma Carter', 'uma21@example.com', '9000000021', 'Female', '591 Olive St, MO', 'AA000021'),
(22, 'Victor Lane', 'victor22@example.com', '9000000022', 'Male', '203 Elm St, IN', 'AA000022'),
(23, 'Wendy Brooks', 'wendy23@example.com', '9000000023', 'Female', '731 Maple St, MA', 'AA000023'),
(24, 'Xander Boyd', 'xander24@example.com', '9000000024', 'Male', '847 Aspen St, OK', 'AA000024'),
(25, 'Yasmin Ellis', 'yasmin25@example.com', '9000000025', 'Female', '299 Birch St, AR', 'AA000025'),
(26, 'Zack Wood', 'zack26@example.com', '9000000026', 'Male', '672 Elm St, KS', 'AA000026'),
(27, 'Ava Turner', 'ava27@example.com', '9000000027', 'Female', '111 Pine St, NM', 'AA000027'),
(28, 'Ben Holt', 'ben28@example.com', '9000000028', 'Male', '488 Oak St, SD', 'AA000028'),
(29, 'Cora Dean', 'cora29@example.com', '9000000029', 'Female', '376 Fir St, TN', 'AA000029'),
(30, 'Dylan Snow', 'dylan30@example.com', '9000000030', 'Male', '982 Cedar St, ME', 'AA000030');



INSERT INTO airport (Airport_ID, name, location) VALUES
(1, 'John F. Kennedy International Airport', 'New York'),
(2, 'Los Angeles International Airport', 'Los Angeles'),
(3, 'O\'Hare International Airport', 'Chicago'),
(4, 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta'),
(5, 'Dallas/Fort Worth International Airport', 'Dallas');


INSERT INTO flight (Flight_ID, Airline, Source_Airport, Destination_Airport, Departure_Time, Arrival_Time, Duration, Capacity) VALUES
(1, 'Delta Airlines', 1, 2, '08:00:00', '11:00:00', 180, 180),
(2, 'United Airlines', 2, 3, '09:00:00', '12:00:00', 180, 160),
(3, 'American Airlines', 3, 4, '10:00:00', '13:00:00', 180, 150),
(4, 'Southwest Airlines', 4, 5, '11:00:00', '14:00:00', 180, 140),
(5, 'JetBlue Airways', 5, 1, '12:00:00', '15:00:00', 180, 130),
(6, 'Spirit Airlines', 1, 3, '13:00:00', '16:00:00', 180, 170),
(7, 'Alaska Airlines', 2, 4, '14:00:00', '17:00:00', 180, 160),
(8, 'Frontier Airlines', 3, 5, '15:00:00', '18:00:00', 180, 150),
(9, 'Hawaiian Airlines', 4, 1, '16:00:00', '19:00:00', 180, 140),
(10, 'Sun Country Airlines', 5, 2, '17:00:00', '20:00:00', 180, 130);

INSERT INTO reservation (Reservation_ID, passenger_ID, flight_ID, Seat_Number, Booking_Date, Status) VALUES
(1, 1, 1, '1A', '2025-04-01 09:00:00', 'Confirmed'),
(2, 2, 1, '1B', '2025-04-01 09:10:00', 'Confirmed'),
(3, 3, 2, '2A', '2025-04-01 09:20:00', 'Pending'),
(4, 4, 2, '2B', '2025-04-01 09:30:00', 'Cancelled'),
(5, 5, 3, '3A', '2025-04-01 09:40:00', 'Confirmed'),
(6, 6, 3, '3B', '2025-04-01 09:50:00', 'Confirmed'),
(7, 7, 4, '4A', '2025-04-01 10:00:00', 'Pending'),
(8, 8, 4, '4B', '2025-04-01 10:10:00', 'Cancelled'),
(9, 9, 5, '5A', '2025-04-01 10:20:00', 'Confirmed'),
(10, 10, 5, '5B', '2025-04-01 10:30:00', 'Confirmed'),
(11, 11, 6, '6A', '2025-04-01 10:40:00', 'Confirmed'),
(12, 12, 6, '6B', '2025-04-01 10:50:00', 'Confirmed'),
(13, 13, 7, '7A', '2025-04-01 11:00:00', 'Confirmed'),
(14, 14, 7, '7B', '2025-04-01 11:10:00', 'Confirmed'),
(15, 15, 8, '8A', '2025-04-01 11:20:00', 'Pending'),
(16, 16, 8, '8B', '2025-04-01 11:30:00', 'Confirmed'),
(17, 17, 9, '9A', '2025-04-01 11:40:00', 'Cancelled'),
(18, 18, 9, '9B', '2025-04-01 11:50:00', 'Confirmed'),
(19, 19, 10, '10A', '2025-04-01 12:00:00', 'Pending'),
(20, 20, 10, '10B', '2025-04-01 12:10:00', 'Confirmed'),
(21, 21, 1, '11A', '2025-04-01 12:20:00', 'Confirmed'),
(22, 22, 2, '12A', '2025-04-01 12:30:00', 'Cancelled'),
(23, 23, 3, '13A', '2025-04-01 12:40:00', 'Confirmed'),
(24, 24, 4, '14A', '2025-04-01 12:50:00', 'Confirmed'),
(25, 25, 5, '15A', '2025-04-01 13:00:00', 'Pending'),
(26, 26, 6, '16A', '2025-04-01 13:10:00', 'Confirmed'),
(27, 27, 7, '17A', '2025-04-01 13:20:00', 'Confirmed'),
(28, 28, 8, '18A', '2025-04-01 13:30:00', 'Confirmed'),
(29, 29, 9, '19A', '2025-04-01 13:40:00', 'Confirmed'),
(30, 30, 10, '20A', '2025-04-01 13:50:00', 'Confirmed');


INSERT INTO Payment (Payment_ID, Reservation_ID, Payment_Date, Amount, Payment_Method) VALUES
(1, 1, '2025-04-01', 250.00, 'Credit Card'),
(2, 2, '2025-04-01', 300.00, 'PayPal'),
(3, 5, '2025-04-01', 275.00, 'UPI'),
(4, 6, '2025-04-01', 290.00, 'Cash'),
(5, 9, '2025-04-01', 310.00, 'Credit Card'),
(6, 10, '2025-04-01', 320.00, 'UPI'),
(7, 11, '2025-04-01', 220.00, 'Credit Card'),
(8, 12, '2025-04-01', 210.00, 'Cash'),
(9, 13, '2025-04-01', 180.00, 'Credit Card'),
(10, 14, '2025-04-01', 170.00, 'PayPal'),
(11, 16, '2025-04-01', 160.00, 'UPI'),
(12, 18, '2025-04-01', 200.00, 'Credit Card'),
(13, 20, '2025-04-01', 195.00, 'PayPal'),
(14, 21, '2025-04-01', 205.00, 'Credit Card'),
(15, 23, '2025-04-01', 300.00, 'Credit Card'),
(16, 24, '2025-04-01', 305.00, 'UPI'),
(17, 26, '2025-04-01', 310.00, 'Cash'),
(18, 27, '2025-04-01', 320.00, 'Credit Card'),
(19, 28, '2025-04-01', 330.00, 'PayPal'),
(20, 29, '2025-04-01', 340.00, 'UPI'),
(21, 30, '2025-04-01', 350.00, 'Credit Card'),
(22, 3, '2025-04-01', 180.00, 'Cash'),
(23, 4, '2025-04-01', 190.00, 'Credit Card'),
(24, 7, '2025-04-01', 195.00, 'UPI'),
(25, 8, '2025-04-01', 185.00, 'Credit Card');

INSERT INTO Ticket (Ticket_ID, reservation_ID, Issue_Date, Seat_Number, Price) VALUES
(1, 1, '2025-04-01', '1A', 250.00),
(2, 2, '2025-04-01', '1B', 300.00),
(3, 5, '2025-04-01', '3A', 275.00),
(4, 6, '2025-04-01', '3B', 290.00),
(5, 9, '2025-04-01', '5A', 310.00),
(6, 10, '2025-04-01', '5B', 320.00),
(7, 11, '2025-04-01', '6A', 220.00),
(8, 12, '2025-04-01', '6B', 210.00),
(9, 13, '2025-04-01', '7A', 180.00),
(10, 14, '2025-04-01', '7B', 170.00),
(11, 16, '2025-04-01', '8B', 160.00),
(12, 18, '2025-04-01', '9B', 200.00),
(13, 20, '2025-04-01', '10B', 195.00),
(14, 21, '2025-04-01', '11A', 205.00),
(15, 23, '2025-04-01', '13A', 300.00),
(16, 24, '2025-04-01', '14A', 305.00),
(17, 26, '2025-04-01', '16A', 310.00),
(18, 27, '2025-04-01', '17A', 320.00),
(19, 28, '2025-04-01', '18A', 330.00),
(20, 29, '2025-04-01', '19A', 340.00),
(21, 30, '2025-04-01', '20A', 350.00),
(22, 3, '2025-04-01', '2A', 180.00),
(23, 4, '2025-04-01', '2B', 190.00),
(24, 7, '2025-04-01', '4A', 195.00),
(25, 8, '2025-04-01', '4B', 185.00);

select * from passenger;
select * from reservation;
select * from airport;
select * from flight;
select * from payment;
select * from ticket;

-- view

create view passenger_details as 
select passenger_id,name,email,phone,address,passport_number
from passenger
order by passenger_id;
select * from passenger_details;

-- Show all reservations with flight and passenger details.

create view reservation_flight_passenger_details as
select r.reservation_id,p.passenger_id,p.name, f.flight_id,f.Airline,r.seat_number
from reservation r
join passenger p on p.passenger_id = r.passenger_id
join flight f on f.flight_id = r.flight_id;
select * from reservation_flight_passenger_details;

-- Find all flights from a specific source to destination.

create view source_destination as 
select * from flight
where source_airport = 1 and destination_airport= 2 ;
select * from source_destination;

-- Find passengers who booked but haven’t paid yet.

create view not_paid as
select p.name,r.reservation_id
from passenger p
join reservation r on p.passenger_id = r.reservation_id
left join payment py on r.reservation_id = py.reservation_id
where py.reservation_id is null
order by reservation_id;
select * from not_paid;

 -- How do you create a stored procedure to add a new passenger
 DELIMITER //

CREATE PROCEDURE AddPassenger(
    IN p_id int,
    IN p_Name VARCHAR(100),
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(20),
    IN p_Gender VARCHAR(10),
    IN p_Address TEXT,
    IN p_Passport_number CHAR(8)
)
BEGIN
    INSERT INTO passenger(passenger_id,Name, Email, Phone, gender, Address, Passport_Number)
    VALUES (p_id,p_Name, p_Email, p_Phone, p_Gender, p_Address, p_Passport_number);
END //

DELIMITER ;
CALL AddPassenger(31,'Alice John', 'alice@example.com', '9876543210', 'Female', 'New York', 'PA123456');
select * from passenger;

-- How do you create a stored procedure to book a reservation

DELIMITER //

CREATE PROCEDURE BookReservation(
    IN reservation_id int, 
    IN p_passenger_ID INT,
    IN p_flight_ID INT,
    IN p_Seat_Number VARCHAR(10),
    IN p_Booking_Date TIMESTAMP
)
BEGIN
    INSERT INTO reservation(reservation_id,passenger_ID, flight_ID, Seat_Number, Booking_Date, Status)
    VALUES (reservation_id,p_passenger_ID, p_flight_ID, p_Seat_Number, p_Booking_Date, 'Confirmed');
END //

DELIMITER ;
call bookreservation(31,22,5,'21A','2025-04-01 09:00:00');
select * from reservation;

-- How do you create a procedure to generate a ticket

DELIMITER //

CREATE PROCEDURE IssueTicket(
    IN P_ticket_id int,
    IN p_Reservation_ID INT,
    IN p_Issue_Date DATE,
    IN p_Seat_Number VARCHAR(10),
    IN p_Price DECIMAL(10,2)
)
BEGIN
    INSERT INTO Ticket(ticket_id,reservation_ID, Issue_Date, Seat_Number, Price)
    VALUES (p_ticket_id,p_Reservation_ID, p_Issue_Date, p_Seat_Number, p_Price);
END //

DELIMITER ;
call issueTicket(26,10,'2025-04-01','21A',220.00);
select * from ticket;

-- How to view reservation details by passenger ID.

DELIMITER //

CREATE PROCEDURE GetPassengerReservations(
    IN p_passenger_ID INT
)
BEGIN
    SELECT r.Reservation_ID, f.Airline, f.Departure_Time, f.Arrival_Time, r.Seat_Number, r.Status
    FROM reservation r
    JOIN flight f ON r.flight_ID = f.Flight_ID
    WHERE r.passenger_ID = p_passenger_ID;
END //

DELIMITER ;
CALL GetPassengerReservations(6);

--  How do you cancel a reservation using a procedure

DELIMITER //

CREATE PROCEDURE CancelReservation(
    IN p_Reservation_ID INT
)
BEGIN
    UPDATE reservation
    SET Status = 'Cancelled'
    WHERE Reservation_ID = p_Reservation_ID;
END //

DELIMITER ;
call cancelreservation(31);
select * from reservation;

--  Write a procedure to check seat availability for a flight.
DELIMITER //

CREATE PROCEDURE CheckSeatAvailability(
    IN p_flight_ID INT
)
BEGIN
    DECLARE total_capacity INT;
    DECLARE booked_seats INT;

    SELECT Capacity INTO total_capacity
    FROM flight
    WHERE Flight_ID = p_flight_ID;

    SELECT COUNT(*) INTO booked_seats
    FROM reservation
    WHERE flight_ID = p_flight_ID AND Status = 'Confirmed';

    SELECT total_capacity - booked_seats AS Available_Seats;
END //

DELIMITER ;
CALL CheckSeatAvailability(7);