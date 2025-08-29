USE hospitalDB;


-- JOINS:

-- 1. Show patient names with their doctor names and department
SELECT p.Name AS Patient, d.Name AS Doctor, dept.DeptName
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Departments dept ON d.DeptID = dept.DeptID;

-- 2. List all appointments with patient name, doctor name, and date
SELECT a.AppointmentDate, p.Name AS Patient, d.Name AS Doctor
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- 3. Show each bill with patient name and bill status
SELECT b.BillID, p.Name AS Patient, b.Amount, b.Status
FROM Bills b
JOIN Patients p ON b.PatientID = p.PatientID;

-- 4. Find medications prescribed to each patient
SELECT p.Name AS Patient, m.MedicineName AS Medication
FROM Patients p
JOIN MedicalRecords r ON p.PatientID = r.PatientID
JOIN Medications m ON r.RecordID = m.RecordID;


-- 5. Show doctors and their departments
SELECT d.Name AS Doctor, dept.DeptName
FROM Doctors d
JOIN Departments dept ON d.DeptID = dept.DeptID;



-- GROUPING 

-- 1. Show number of doctors in each department
SELECT dept.DeptName, COUNT(d.DoctorID) AS NumDoctors
FROM Departments dept
LEFT JOIN Doctors d ON dept.DeptID = d.DeptID
GROUP BY dept.DeptName;

-- 2. Find number of appointments for each patient
SELECT p.Name, COUNT(a.AppointmentID) AS NumAppointments
FROM Patients p
LEFT JOIN Appointments a ON p.PatientID = a.PatientID
GROUP BY p.Name;

-- 3. Find total bill amount (paid + unpaid) per patient
SELECT p.Name, SUM(b.Amount) AS TotalBill
FROM Patients p
JOIN Bills b ON p.PatientID = b.PatientID
GROUP BY p.Name;

-- 4. Find doctors with more than 2 appointments
SELECT d.Name, COUNT(a.AppointmentID) AS NumAppointments
FROM Doctors d
JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.Name
HAVING COUNT(a.AppointmentID) > 2;

-- 5. Show latest medical record date for each patient
SELECT p.Name, MAX(m.RecordDate) AS LatestRecord
FROM Patients p
JOIN MedicalRecords m ON p.PatientID = m.PatientID
GROUP BY p.Name;




-- SUBQUERIES

-- 1. Find patients who have unpaid bills
SELECT Name
FROM Patients
WHERE PatientID IN (
    SELECT PatientID FROM Bills WHERE Status = 'Unpaid'
);

-- 2. Find doctor with the maximum number of appointments
SELECT d.Name
FROM Doctors d
WHERE d.DoctorID = (
    SELECT a.DoctorID
    FROM Appointments a
    GROUP BY a.DoctorID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 3. Find patients who have never had an appointment
SELECT Name
FROM Patients
WHERE PatientID NOT IN (SELECT PatientID FROM Appointments);

-- 4. Find patients who do not have any medical records
SELECT Name
FROM Patients p
WHERE NOT EXISTS (
    SELECT 1 FROM MedicalRecords m WHERE m.PatientID = p.PatientID
);

-- 5. Find bills that are above the average bill amount
SELECT BillID, Amount
FROM Bills
WHERE Amount > (SELECT AVG(Amount) FROM Bills);
