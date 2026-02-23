CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

-- =========================
-- PATIENT TABLE
-- =========================
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

-- =========================
-- DOCTOR TABLE
-- =========================
CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Specialization VARCHAR(50),
    Phone VARCHAR(15),
    Salary DECIMAL(10,2)
);

-- =========================
-- APPOINTMENT TABLE
-- =========================
CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
        ON DELETE CASCADE
);

-- =========================
-- ROOM TABLE
-- =========================
CREATE TABLE Room (
    Room_ID INT PRIMARY KEY AUTO_INCREMENT,
    Room_Type VARCHAR(30),
    Charges_Per_Day DECIMAL(10,2),
    Availability_Status VARCHAR(20)
);

-- =========================
-- ADMISSION TABLE
-- =========================
CREATE TABLE Admission (
    Admission_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Room_ID INT,
    Admit_Date DATE,
    Discharge_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
        ON DELETE CASCADE
);

-- =========================
-- BILL TABLE
-- =========================
CREATE TABLE Bill (
    Bill_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Amount DECIMAL(10,2),
    Payment_Status VARCHAR(20),
    Bill_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
        ON DELETE CASCADE
);

-- =========================
-- SAMPLE DATA
-- =========================

INSERT INTO Patient (Name, Age, Gender, Phone, Address)
VALUES 
('Rahul Sharma', 25, 'Male', '9876543210', 'Delhi'),
('Anita Verma', 30, 'Female', '9123456789', 'Mumbai');

INSERT INTO Doctor (Name, Specialization, Phone, Salary)
VALUES 
('Dr. Mehta', 'Cardiologist', '9988776655', 80000),
('Dr. Singh', 'Neurologist', '8877665544', 90000);

INSERT INTO Room (Room_Type, Charges_Per_Day, Availability_Status)
VALUES
('General', 1000, 'Available'),
('ICU', 5000, 'Occupied');

INSERT INTO Appointment (Patient_ID, Doctor_ID, Appointment_Date, Status)
VALUES
(1, 1, '2026-02-20', 'Scheduled'),
(2, 2, '2026-02-22', 'Completed');

INSERT INTO Bill (Patient_ID, Amount, Payment_Status, Bill_Date)
VALUES
(1, 5000, 'Paid', '2026-02-20'),
(2, 8000, 'Pending', '2026-02-22');