-- Create Database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender VARCHAR(10),
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(255)
);

-- Departments Table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(100) NOT NULL
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    Phone VARCHAR(15) UNIQUE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Status VARCHAR(50) DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Medical Records Table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    RecordDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Medications Table
CREATE TABLE Medications (
    MedID INT PRIMARY KEY AUTO_INCREMENT,
    RecordID INT,
    MedicineName VARCHAR(100),
    Dosage VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID)
);

-- Bills Table
CREATE TABLE Bills (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    Amount DECIMAL(10,2),
    BillDate DATE,
    Status VARCHAR(20) DEFAULT 'Unpaid',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);


-- Insert Departments
INSERT INTO Departments (DeptName) VALUES
('Cardiology'), ('Neurology'), ('Orthopedics'), ('Pediatrics');

-- Insert Doctors
INSERT INTO Doctors (Name, Specialty, Phone, DeptID) VALUES
('Dr. Sharma', 'Cardiologist', '9876543210', 1),
('Dr. Mehta', 'Neurologist', '9876543211', 2),
('Dr. Rao', 'Orthopedic', '9876543212', 3),
('Dr. Kapoor', 'Pediatrician', '9876543213', 4),
('Dr. Reddy', 'Cardiologist', '9876543214', 1);

-- Insert Patients
INSERT INTO Patients (Name, DOB, Gender, Phone, Address) VALUES
('Amit Kumar', '1990-05-14', 'Male', '9998887771', 'Delhi'),
('Priya Singh', '1985-11-22', 'Female', '9998887772', 'Mumbai'),
('Ravi Verma', '2000-02-10', 'Male', '9998887773', 'Bangalore'),
('Neha Gupta', '1995-07-19', 'Female', '9998887774', 'Chennai'),
('Suresh Iyer', '1978-03-02', 'Male', '9998887775', 'Kolkata');

-- Insert Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '2025-08-28', '10:30:00', 'Scheduled'),
(1, 2, '2025-08-29', '11:00:00', 'Completed'),
(2, 2, '2025-08-30', '14:00:00', 'Scheduled'),
(3, 3, '2025-08-31', '09:30:00', 'Completed'),
(4, 4, '2025-08-28', '15:00:00', 'Scheduled'),
(5, 1, '2025-08-27', '12:00:00', 'Completed'),
(5, 5, '2025-08-29', '10:00:00', 'Scheduled');

-- Insert Medical Records
INSERT INTO MedicalRecords (PatientID, Diagnosis, Treatment, RecordDate) VALUES
(1, 'Hypertension', 'Lifestyle changes + Medication', '2025-08-20'),
(1, 'Migraine', 'Pain relief + Relaxation therapy', '2025-08-21'),
(2, 'Epilepsy', 'Anti-seizure medication', '2025-08-19'),
(3, 'Fracture', 'Cast + Rest', '2025-08-15'),
(4, 'Fever', 'Paracetamol + Fluids', '2025-08-22'),
(5, 'Heart Disease', 'Surgery recommendation', '2025-08-23');

-- Insert Medications
INSERT INTO Medications (RecordID, MedicineName, Dosage, Duration) VALUES
(1, 'Amlodipine', '5mg', '30 days'),
(2, 'Ibuprofen', '400mg', '7 days'),
(3, 'Carbamazepine', '200mg', '60 days'),
(4, 'Calcium + Vitamin D', '1 tab', '45 days'),
(5, 'Paracetamol', '500mg', '5 days'),
(6, 'Aspirin', '75mg', '90 days');

-- Insert Bills
INSERT INTO Bills (PatientID, Amount, BillDate, Status) VALUES
(1, 2500.00, '2025-08-20', 'Paid'),
(1, 1200.00, '2025-08-21', 'Unpaid'),
(2, 1800.00, '2025-08-21', 'Unpaid'),
(3, 5000.00, '2025-08-15', 'Paid'),
(4, 700.00,  '2025-08-22', 'Paid'),
(5, 15000.00,'2025-08-23', 'Unpaid');

