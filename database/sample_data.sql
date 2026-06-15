PRAGMA foreign_keys = ON;

INSERT INTO departments (department_id, department_code, department_name) VALUES
(1, 'CS', 'Computer Science'),
(2, 'IS', 'Information Systems'),
(3, 'BUS', 'Business Administration'),
(4, 'MATH', 'Mathematics'),
(5, 'ENG', 'English Language');

INSERT INTO students (student_id, university_id, first_name, last_name, email, gender, date_of_birth, department_id, enrollment_year, status) VALUES
(1, 'U2022001', 'Aisha', 'Alqahtani', 'aisha.alqahtani@university.edu', 'Female', '2004-02-14', 1, 2022, 'Active'),
(2, 'U2022002', 'Omar', 'Alharbi', 'omar.alharbi@university.edu', 'Male', '2003-11-08', 1, 2022, 'Active'),
(3, 'U2022003', 'Sara', 'Almutairi', 'sara.almutairi@university.edu', 'Female', '2004-04-21', 2, 2022, 'Active'),
(4, 'U2022004', 'Fahad', 'Alotaibi', 'fahad.alotaibi@university.edu', 'Male', '2003-09-19', 2, 2022, 'Active'),
(5, 'U2022005', 'Noura', 'Alanzi', 'noura.alanzi@university.edu', 'Female', '2004-07-30', 3, 2022, 'Active'),
(6, 'U2022006', 'Khalid', 'Alsubaie', 'khalid.alsubaie@university.edu', 'Male', '2003-05-13', 3, 2022, 'Active'),
(7, 'U2022007', 'Maha', 'Alzahrani', 'maha.alzahrani@university.edu', 'Female', '2004-01-28', 4, 2022, 'Active'),
(8, 'U2022008', 'Yousef', 'Alghamdi', 'yousef.alghamdi@university.edu', 'Male', '2003-12-02', 4, 2022, 'Active'),
(9, 'U2022009', 'Lina', 'Alrashid', 'lina.alrashid@university.edu', 'Female', '2004-06-16', 5, 2022, 'Active'),
(10, 'U2022010', 'Abdulaziz', 'Alfahad', 'abdulaziz.alfahad@university.edu', 'Male', '2003-03-25', 5, 2022, 'Active'),
(11, 'U2023011', 'Reem', 'Alnasser', 'reem.alnasser@university.edu', 'Female', '2005-08-10', 1, 2023, 'Active'),
(12, 'U2023012', 'Saad', 'Alshammari', 'saad.alshammari@university.edu', 'Male', '2004-10-05', 1, 2023, 'Active'),
(13, 'U2023013', 'Huda', 'Alomari', 'huda.alomari@university.edu', 'Female', '2005-02-18', 2, 2023, 'Active'),
(14, 'U2023014', 'Turki', 'Alenezi', 'turki.alenezi@university.edu', 'Male', '2004-07-09', 2, 2023, 'Active'),
(15, 'U2023015', 'Dana', 'Almansour', 'dana.almansour@university.edu', 'Female', '2005-01-17', 3, 2023, 'Active'),
(16, 'U2023016', 'Majed', 'Alruwaili', 'majed.alruwaili@university.edu', 'Male', '2004-09-23', 3, 2023, 'Active'),
(17, 'U2023017', 'Latifa', 'Alsaif', 'latifa.alsaif@university.edu', 'Female', '2005-05-11', 4, 2023, 'Active'),
(18, 'U2023018', 'Bader', 'Almalki', 'bader.almalki@university.edu', 'Male', '2004-12-29', 4, 2023, 'Active'),
(19, 'U2023019', 'Jawaher', 'Alshahrani', 'jawaher.alshahrani@university.edu', 'Female', '2005-06-03', 5, 2023, 'Active'),
(20, 'U2023020', 'Sultan', 'Alkhaldi', 'sultan.alkhaldi@university.edu', 'Male', '2004-03-12', 5, 2023, 'Active'),
(21, 'U2024021', 'Maryam', 'Alabdullah', 'maryam.alabdullah@university.edu', 'Female', '2006-04-04', 1, 2024, 'Active'),
(22, 'U2024022', 'Nawaf', 'Alhussain', 'nawaf.alhussain@university.edu', 'Male', '2005-11-22', 1, 2024, 'Active'),
(23, 'U2024023', 'Raghad', 'Aljohani', 'raghad.aljohani@university.edu', 'Female', '2006-01-09', 2, 2024, 'Active'),
(24, 'U2024024', 'Meshari', 'Alamri', 'meshari.alamri@university.edu', 'Male', '2005-08-27', 2, 2024, 'Active'),
(25, 'U2024025', 'Shahad', 'Albishi', 'shahad.albishi@university.edu', 'Female', '2006-02-20', 3, 2024, 'Active'),
(26, 'U2024026', 'Rakan', 'Aldosari', 'rakan.aldosari@university.edu', 'Male', '2005-10-14', 3, 2024, 'Active'),
(27, 'U2024027', 'Hanan', 'Alshareef', 'hanan.alshareef@university.edu', 'Female', '2006-03-06', 4, 2024, 'Active'),
(28, 'U2024028', 'Ibrahim', 'Almajid', 'ibrahim.almajid@university.edu', 'Male', '2005-07-18', 4, 2024, 'Active'),
(29, 'U2024029', 'Jana', 'Alfaisal', 'jana.alfaisal@university.edu', 'Female', '2006-05-24', 5, 2024, 'Active'),
(30, 'U2024030', 'Hassan', 'Alhabib', 'hassan.alhabib@university.edu', 'Male', '2005-12-07', 5, 2024, 'Active');

INSERT INTO instructors (instructor_id, employee_number, first_name, last_name, email, department_id, title) VALUES
(1, 'E1001', 'Mona', 'Alsaud', 'mona.alsaud@university.edu', 1, 'Associate Professor'),
(2, 'E1002', 'Tariq', 'Alfarsi', 'tariq.alfarsi@university.edu', 1, 'Assistant Professor'),
(3, 'E1003', 'Heba', 'Alqadi', 'heba.alqadi@university.edu', 2, 'Lecturer'),
(4, 'E1004', 'Saleh', 'Alnami', 'saleh.alnami@university.edu', 2, 'Assistant Professor'),
(5, 'E1005', 'Amal', 'Alotaibi', 'amal.alotaibi@university.edu', 3, 'Associate Professor'),
(6, 'E1006', 'Faisal', 'Almutairi', 'faisal.almutairi@university.edu', 3, 'Lecturer'),
(7, 'E1007', 'Rania', 'Alghamdi', 'rania.alghamdi@university.edu', 4, 'Professor'),
(8, 'E1008', 'Nasser', 'Alharbi', 'nasser.alharbi@university.edu', 4, 'Assistant Professor'),
(9, 'E1009', 'Samia', 'Alrashid', 'samia.alrashid@university.edu', 5, 'Lecturer'),
(10, 'E1010', 'Yasir', 'Alzahrani', 'yasir.alzahrani@university.edu', 5, 'Assistant Professor');

INSERT INTO courses (course_id, course_code, course_name, credit_hours, department_id, course_level) VALUES
(1, 'CS101', 'Introduction to Programming', 3, 1, 100),
(2, 'CS201', 'Data Structures', 3, 1, 200),
(3, 'CS301', 'Database Systems', 3, 1, 300),
(4, 'CS340', 'Web Application Development', 3, 1, 300),
(5, 'IS101', 'Foundations of Information Systems', 3, 2, 100),
(6, 'IS210', 'Systems Analysis and Design', 3, 2, 200),
(7, 'IS320', 'Enterprise Architecture', 3, 2, 300),
(8, 'IS410', 'IT Project Management', 3, 2, 400),
(9, 'BUS101', 'Principles of Management', 3, 3, 100),
(10, 'BUS220', 'Financial Accounting', 3, 3, 200),
(11, 'BUS330', 'Business Analytics', 3, 3, 300),
(12, 'BUS450', 'Strategic Management', 3, 3, 400),
(13, 'MATH101', 'Calculus I', 4, 4, 100),
(14, 'MATH210', 'Linear Algebra', 3, 4, 200),
(15, 'MATH320', 'Probability and Statistics', 3, 4, 300),
(16, 'MATH430', 'Operations Research', 3, 4, 400),
(17, 'ENG101', 'Academic Writing', 3, 5, 100),
(18, 'ENG205', 'Technical Communication', 3, 5, 200),
(19, 'ENG310', 'Professional Presentation', 2, 5, 300),
(20, 'ENG420', 'Research Writing', 3, 5, 400);

INSERT INTO semesters (semester_id, semester_name, academic_year, start_date, end_date) VALUES
(1, 'Fall', '2023-2024', '2023-08-20', '2023-12-14'),
(2, 'Spring', '2023-2024', '2024-01-14', '2024-05-09'),
(3, 'Fall', '2024-2025', '2024-08-18', '2024-12-12'),
(4, 'Spring', '2024-2025', '2025-01-12', '2025-05-08');

INSERT INTO course_offerings (offering_id, course_id, instructor_id, semester_id, section_number, capacity, schedule_day, schedule_time, room) VALUES
(1, 1, 1, 1, '01', 35, 'Sunday', '09:00-10:15', 'B101'),
(2, 5, 3, 1, '01', 35, 'Monday', '10:30-11:45', 'B102'),
(3, 9, 5, 1, '01', 40, 'Tuesday', '09:00-10:15', 'C201'),
(4, 13, 7, 1, '01', 30, 'Wednesday', '08:00-09:15', 'A110'),
(5, 17, 9, 1, '01', 35, 'Thursday', '11:00-12:15', 'D105'),
(6, 2, 2, 1, '01', 30, 'Sunday', '13:00-14:15', 'B202'),
(7, 6, 4, 1, '01', 30, 'Monday', '13:00-14:15', 'B203'),
(8, 10, 6, 1, '01', 40, 'Tuesday', '13:00-14:15', 'C205'),
(9, 1, 1, 2, '01', 35, 'Sunday', '09:00-10:15', 'B101'),
(10, 2, 2, 2, '01', 30, 'Monday', '10:30-11:45', 'B202'),
(11, 3, 1, 2, '01', 30, 'Tuesday', '09:00-10:15', 'B204'),
(12, 5, 3, 2, '01', 35, 'Wednesday', '10:30-11:45', 'B102'),
(13, 6, 4, 2, '01', 30, 'Thursday', '09:00-10:15', 'B203'),
(14, 14, 8, 2, '01', 30, 'Sunday', '11:00-12:15', 'A112'),
(15, 18, 10, 2, '01', 35, 'Monday', '11:00-12:15', 'D106'),
(16, 3, 1, 3, '01', 30, 'Sunday', '09:00-10:15', 'B204'),
(17, 4, 2, 3, '01', 30, 'Monday', '13:00-14:15', 'B210'),
(18, 7, 3, 3, '01', 30, 'Tuesday', '10:30-11:45', 'B301'),
(19, 8, 4, 3, '01', 30, 'Wednesday', '13:00-14:15', 'B302'),
(20, 11, 5, 3, '01', 40, 'Thursday', '09:00-10:15', 'C210'),
(21, 12, 6, 3, '01', 40, 'Sunday', '10:30-11:45', 'C215'),
(22, 15, 7, 3, '01', 30, 'Monday', '09:00-10:15', 'A115'),
(23, 16, 8, 3, '01', 30, 'Tuesday', '13:00-14:15', 'A118'),
(24, 19, 9, 3, '01', 35, 'Wednesday', '09:00-10:15', 'D110'),
(25, 20, 10, 3, '01', 35, 'Thursday', '13:00-14:15', 'D112'),
(26, 1, 1, 4, '01', 35, 'Sunday', '08:00-09:15', 'B101'),
(27, 2, 2, 4, '01', 30, 'Monday', '08:00-09:15', 'B202'),
(28, 3, 1, 4, '02', 30, 'Tuesday', '11:00-12:15', 'B204'),
(29, 6, 4, 4, '02', 30, 'Wednesday', '08:00-09:15', 'B203'),
(30, 11, 5, 4, '02', 40, 'Thursday', '11:00-12:15', 'C210'),
(31, 15, 7, 4, '02', 30, 'Sunday', '13:00-14:15', 'A115'),
(32, 18, 10, 4, '02', 35, 'Monday', '13:00-14:15', 'D106');

WITH RECURSIVE seq(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 120
)
INSERT INTO enrollments (enrollment_id, student_id, offering_id, enrollment_date, status)
SELECT
    n,
    ((n - 1) % 30) + 1,
    ((n * 7 - 7) % 32) + 1,
    CASE
        WHEN ((n * 7 - 7) % 32) + 1 <= 8 THEN '2023-08-22'
        WHEN ((n * 7 - 7) % 32) + 1 <= 15 THEN '2024-01-16'
        WHEN ((n * 7 - 7) % 32) + 1 <= 25 THEN '2024-08-20'
        ELSE '2025-01-14'
    END,
    CASE
        WHEN ((n * 7 - 7) % 32) + 1 >= 26 THEN 'Enrolled'
        WHEN n % 17 = 0 THEN 'Withdrawn'
        WHEN n % 19 = 0 THEN 'Failed'
        ELSE 'Completed'
    END
FROM seq;

INSERT INTO grades (enrollment_id, letter_grade, grade_points, numeric_score)
SELECT
    enrollment_id,
    CASE
        WHEN status = 'Failed' THEN 'F'
        WHEN enrollment_id % 11 = 0 THEN 'D'
        WHEN enrollment_id % 7 = 0 THEN 'C'
        WHEN enrollment_id % 5 = 0 THEN 'C+'
        WHEN enrollment_id % 3 = 0 THEN 'B'
        WHEN enrollment_id % 2 = 0 THEN 'B+'
        ELSE 'A'
    END AS letter_grade,
    CASE
        WHEN status = 'Failed' THEN 0.0
        WHEN enrollment_id % 11 = 0 THEN 1.0
        WHEN enrollment_id % 7 = 0 THEN 2.0
        WHEN enrollment_id % 5 = 0 THEN 2.5
        WHEN enrollment_id % 3 = 0 THEN 3.0
        WHEN enrollment_id % 2 = 0 THEN 3.5
        ELSE 4.0
    END AS grade_points,
    CASE
        WHEN status = 'Failed' THEN 55
        WHEN enrollment_id % 11 = 0 THEN 64
        WHEN enrollment_id % 7 = 0 THEN 73
        WHEN enrollment_id % 5 = 0 THEN 78
        WHEN enrollment_id % 3 = 0 THEN 84
        WHEN enrollment_id % 2 = 0 THEN 89
        ELSE 94
    END AS numeric_score
FROM enrollments
WHERE status IN ('Completed', 'Failed');
