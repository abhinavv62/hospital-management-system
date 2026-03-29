-- 1. Display all patients
SELECT * FROM Patient;

-- 2. Display all doctors with specialization
SELECT Name, Specialization FROM Doctor;

-- 3. Show all appointments with patient and doctor names
SELECT p.Name AS Patient, d.Name AS Doctor, a.Appointment_Date
FROM Appointment a
JOIN Patient p ON a.Patient_ID = p.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID;

-- 4. Count total number of patients
SELECT COUNT(*) AS Total_Patients FROM Patient;

-- 5. Find total salary of all doctors
SELECT SUM(Salary) AS Total_Salary FROM Doctor;

-- 6. Show patients older than 25
SELECT Name, Age FROM Patient
WHERE Age > 25;

-- 7. Show all appointments that are scheduled
SELECT * FROM Appointment
WHERE Status = 'Scheduled';

-- 8. Display total bill amount for each patient
SELECT Patient_ID, SUM(Amount) AS Total_Bill
FROM Bill
GROUP BY Patient_ID;

-- 9. Show available rooms
SELECT * FROM Room
WHERE Availability_Status = 'Available';

-- 10. Show patient names with their bill details
SELECT p.Name, b.Amount, b.Payment_Status
FROM Patient p
JOIN Bill b ON p.Patient_ID = b.Patient_ID;

-- 11. Count number of appointments for each doctor
SELECT Doctor_ID, COUNT(*) AS Total_Appointments
FROM Appointment
GROUP BY Doctor_ID;

-- 12. Show patients who have more than one appointment
SELECT Patient_ID, COUNT(*) AS Appointment_Count
FROM Appointment
GROUP BY Patient_ID
HAVING COUNT(*) > 1;

-- 13. Show admission details with room type
SELECT a.Admission_ID, r.Room_Type, a.Admit_Date
FROM Admission a
JOIN Room r ON a.Room_ID = r.Room_ID;

-- 14. Find highest bill amount
SELECT MAX(Amount) AS Highest_Bill FROM Bill;

-- 15. Show doctor name and number of patients handled
SELECT d.Name, COUNT(a.Patient_ID) AS Total_Patients
FROM Doctor d
JOIN Appointment a ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Name;