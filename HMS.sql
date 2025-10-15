CREATE DATABASE Hostel_management;
USE Hostel_management;




CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30),
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    email_id VARCHAR(50) UNIQUE,
    mobile_no VARCHAR(15) UNIQUE,
    gender VARCHAR(10),
    study_progrem VARCHAR(50),
    room_no VARCHAR(10),
    password VARCHAR(30)
);

INSERT INTO Student (username, firstname, lastname, email_id, mobile_no, gender, study_progrem, room_no, password)
VALUES
('ajay123', 'Ajay', 'Kumar', 'ajay.kumar@gmail.com', '9876543210', 'Male', 'B.Tech CSE', 'A-101', 'ajay@123'),
('ramu45', 'Ramu', 'Singh', 'ramu.singh@gmail.com', '9890011223', 'Male', 'B.Tech ECE', 'A-102', 'ramu@45'),
('neha09', 'Neha', 'Sharma', 'neha.sharma@gmail.com', '9765123456', 'Female', 'B.Sc Physics', 'B-201', 'neha@09'),
('suman22', 'Suman', 'Gupta', 'suman.gupta@gmail.com', '9856742310', 'Female', 'BBA', 'B-202', 'suman@22'),
('rahul33', 'Rahul', 'Yadav', 'rahul.yadav@gmail.com', '9988776655', 'Male', 'B.Tech IT', 'A-103', 'rahul@33'),
('pooja88', 'Pooja', 'Patel', 'pooja.patel@gmail.com', '9812345678', 'Female', 'BA English', 'C-301', 'pooja@88'),
('ankit11', 'Ankit', 'Verma', 'ankit.verma@gmail.com', '9900112233', 'Male', 'B.Com', 'C-302', 'ankit@11'),
('deepa77', 'Deepa', 'Rani', 'deepa.rani@gmail.com', '9876001122', 'Female', 'B.Sc Chemistry', 'D-401', 'deepa@77'),
('rohit99', 'Rohit', 'Kumar', 'rohit.kumar@gmail.com', '9845009988', 'Male', 'B.Tech Civil', 'A-104', 'rohit@99'),
('kriti55', 'Kriti', 'Agarwal', 'kriti.agarwal@gmail.com', '9822334455', 'Female', 'MBA', 'E-501', 'kriti@55');
CREATE TABLE Hostels (
    hostel_id INT AUTO_INCREMENT PRIMARY KEY,
    hostel_name VARCHAR(50) UNIQUE,
    location VARCHAR(50),
    total_rooms INT,
    available_rooms INT,
    hostel_type VARCHAR(20),
    contact_person VARCHAR(50),
    contact_no VARCHAR(15) UNIQUE,
    email VARCHAR(50) UNIQUE,
    description VARCHAR(100)
);
INSERT INTO Hostels (hostel_name, location, total_rooms, available_rooms, hostel_type, contact_person, contact_no, email, description)
VALUES
('Aarav Boys Hostel', 'North Campus', 120, 10, 'Boys', 'Ramesh Kumar', '9876500001', 'aarav@hostel.com', 'Spacious rooms with Wi-Fi and study area'),
('Nirmal Girls Hostel', 'South Block', 100, 8, 'Girls', 'Sita Devi', '9876500002', 'nirmal@hostel.com', 'Peaceful environment and mess facility'),
('Vivekananda Hostel', 'East Wing', 150, 15, 'Boys', 'Rajesh Sharma', '9876500003', 'vivek@hostel.com', 'Gym and recreation hall available'),
('Kalpana Chawla Hostel', 'West Campus', 80, 5, 'Girls', 'Meena Verma', '9876500004', 'kalpana@hostel.com', 'Modern rooms with attached washrooms'),
('Tagore Hostel', 'Central Campus', 200, 25, 'Boys', 'Amit Singh', '9876500005', 'tagore@hostel.com', 'Large dining area and study room'),
('Sarojini Hostel', 'South Wing', 90, 12, 'Girls', 'Pooja Patel', '9876500006', 'sarojini@hostel.com', 'Well-maintained and hygienic environment'),
('Patel Hostel', 'East Block', 110, 9, 'Boys', 'Rahul Yadav', '9876500007', 'patel@hostel.com', 'CCTV security and laundry service'),
('Indira Hostel', 'West Block', 130, 11, 'Girls', 'Deepa Rani', '9876500008', 'indira@hostel.com', 'Common room and reading space'),
('Gandhi Hostel', 'Main Campus', 160, 20, 'Boys', 'Ankit Verma', '9876500009', 'gandhi@hostel.com', '24x7 electricity and mess service'),
('Laxmi Bai Hostel', 'South Campus', 95, 6, 'Girls', 'Kriti Agarwal', '9876500010', 'laxmibai@hostel.com', 'Hostel with AC rooms and study hall');

CREATE TABLE Rooms (
    Room_id INT AUTO_INCREMENT PRIMARY KEY,
    hostel_id INT,
    Room_Type VARCHAR(30),
    Capacity INT,
    Current_Occupation INT,
    facility VARCHAR(100),
    Room_status VARCHAR(30),
    Monthly_Rent DECIMAL(10,2),
    FOREIGN KEY (hostel_id) REFERENCES Hostels(Hostel_id)
);

INSERT INTO Rooms (hostel_id, room_type, capacity, current_occupation, facility, room_status, monthly_rent)
VALUES
(1, 'Single', 1, 1, 'Attached bathroom, Wi-Fi', 'Occupied', 6000.00),
(1, 'Double', 2, 1, 'Shared bathroom, Balcony', 'Available', 4500.00),
(2, 'Double', 2, 2, 'Wi-Fi, Common area', 'Occupied', 5000.00),
(2, 'Single', 1, 0, 'Attached bathroom, AC', 'Available', 7000.00),
(3, 'Triple', 3, 2, 'Wi-Fi, Study Table', 'Available', 4000.00),
(4, 'Single', 1, 1, 'Attached bathroom, Geyser', 'Occupied', 6500.00),
(5, 'Double', 2, 2, 'Common washroom, Fan', 'Occupied', 4000.00),
(6, 'Double', 2, 1, 'Wi-Fi, Laundry Access', 'Available', 4800.00),
(7, 'Single', 1, 0, 'Attached bathroom, AC', 'Available', 7500.00),
(8, 'Triple', 3, 3, 'Wi-Fi, Shared Wardrobe', 'Occupied', 3800.00);
CREATE TABLE Fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    room_id INT,
    month_year VARCHAR(15),
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
INSERT INTO Fees (student_id, room_id, month_year, amount, payment_date, payment_status)
VALUES
-- September 2025 Payments
(1, 1, 'Sep-2025', 6000.00, '2025-09-05', 'Paid'),
(2, 2, 'Sep-2025', 4500.00, '2025-09-06', 'Paid'),
(3, 3, 'Sep-2025', 5000.00, '2025-09-07', 'Paid'),
(4, 4, 'Sep-2025', 7000.00, '2025-09-08', 'Paid'),
(5, 5, 'Sep-2025', 4000.00, '2025-09-09', 'Paid'),
(6, 6, 'Sep-2025', 6500.00, '2025-09-10', 'Paid'),
(7, 7, 'Sep-2025', 4000.00, '2025-09-11', 'Paid'),
(8, 8, 'Sep-2025', 4800.00, '2025-09-12', 'Paid'),
(9, 9, 'Sep-2025', 7500.00, '2025-09-13', 'Paid'),
(10, 10, 'Sep-2025', 3800.00, '2025-09-14', 'Paid'),

-- October 2025 Payments
(1, 1, 'Oct-2025', 6000.00, '2025-10-05', 'Paid'),
(2, 2, 'Oct-2025', 4500.00, '2025-10-07', 'Pending'),
(3, 3, 'Oct-2025', 5000.00, '2025-10-08', 'Paid'),
(4, 4, 'Oct-2025', 7000.00, '2025-10-09', 'Paid'),
(5, 5, 'Oct-2025', 4000.00, '2025-10-10', 'Pending'),
(6, 6, 'Oct-2025', 6500.00, '2025-10-11', 'Paid'),
(7, 7, 'Oct-2025', 4000.00, '2025-10-12', 'Paid'),
(8, 8, 'Oct-2025', 4800.00, '2025-10-13', 'Paid'),
(9, 9, 'Oct-2025', 7500.00, '2025-10-14', 'Paid'),
(10, 10, 'Oct-2025', 3800.00, '2025-10-15', 'Pending');

CREATE TABLE Requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    request_type VARCHAR(50),
    description VARCHAR(200),
    request_date DATE,
    status VARCHAR(20),
    response VARCHAR(200),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
INSERT INTO Requests (student_id, request_type, description, request_date, status, response)
VALUES
(1, 'Maintenance', 'Light not working in room A-101', '2025-10-01', 'Resolved', 'Electrician fixed the issue'),
(3, 'Room Change', 'Wants to shift to single room', '2025-10-02', 'Pending', NULL),
(4, 'Complaint', 'Mess food quality is poor', '2025-10-03', 'In Progress', 'Complaint forwarded to mess manager'),
(6, 'Maintenance', 'Water leakage in bathroom', '2025-10-04', 'Resolved', 'Plumber repaired leakage'),
(8, 'Room Change', 'Wants to move to lower floor', '2025-10-05', 'Pending', NULL),
(10, 'Other', 'Requesting permission for late night study', '2025-10-06', 'Approved', 'Permission granted till 12 AM');
