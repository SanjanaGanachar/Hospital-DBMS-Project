USE HospitalDB;

-- View: Patient billing summary
CREATE VIEW PatientBillingSummary AS
SELECT p.PatientID, p.Name AS PatientName, SUM(b.Amount) AS TotalBilled
FROM Patients p
JOIN Bills b ON p.PatientID = b.PatientID
GROUP BY p.PatientID, p.Name;

-- View: Doctor workload (appointments per doctor)
CREATE VIEW DoctorWorkload AS
SELECT d.DoctorID, d.Name AS DoctorName, COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.Name;


