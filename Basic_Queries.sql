USE HospitalDB;

-- List all patients with their details
SELECT * FROM patients;

-- Show the names and phone numbers of all doctors
SELECT name, phone FROM doctors;

-- Retrieve all department names
SELECT DeptName FROM departments;

-- Get the names and cities of all patients
SELECT name, address FROM patients;

-- Find all doctors who specialize in "Cardiology"
SELECT name, specialty 
FROM doctors
WHERE specialty = 'Cardiologist';

-- Show all appointments scheduled on a specific date
SELECT * 
FROM Appointments 
WHERE AppointmentDate = '2025-08-29';

-- 7. List all bills with status "Unpaid"
SELECT * FROM Bills WHERE Status = 'Unpaid';

-- 8. Display the names of all patients born after 2000
SELECT Name, DOB FROM Patients WHERE DOB > '2000-01-01';

-- 9. Find all doctors whose phone number starts with '98765'
SELECT * FROM Doctors WHERE Phone LIKE '98765%';

-- 10. Show all medications that have 'mg' dosage (string match since dosage is VARCHAR)
SELECT * FROM Medications WHERE Dosage LIKE '%mg%';

-- 11. Retrieve patient names and their gender
SELECT Name, Gender FROM Patients;

-- 12. List all doctors along with their department IDs
SELECT Name, DeptID FROM Doctors;

-- 13. Find all patients who live in "Bangalore"
SELECT * FROM Patients WHERE Address LIKE '%Bangalore%';

-- 14. Show all appointments with status "Scheduled"
SELECT * FROM Appointments WHERE Status = 'Scheduled';

-- 15. Display all bills where the amount is greater than 1000
SELECT * FROM Bills WHERE Amount > 1000;