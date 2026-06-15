-- 1. Student transcript query
SELECT
    s.university_id,
    s.first_name || ' ' || s.last_name AS student_name,
    sem.semester_name || ' ' || sem.academic_year AS term,
    c.course_code,
    c.course_name,
    c.credit_hours,
    e.status,
    g.letter_grade,
    g.grade_points
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
JOIN semesters sem ON sem.semester_id = co.semester_id
LEFT JOIN grades g ON g.enrollment_id = e.enrollment_id
WHERE s.university_id = 'U2022001'
ORDER BY sem.start_date, c.course_code;

-- 2. Courses currently enrolled by student
SELECT
    s.university_id,
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_code,
    c.course_name,
    sem.semester_name,
    sem.academic_year,
    co.section_number,
    co.schedule_day,
    co.schedule_time,
    co.room
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
JOIN semesters sem ON sem.semester_id = co.semester_id
WHERE s.university_id = 'U2022001'
  AND e.status = 'Enrolled'
ORDER BY sem.start_date DESC, c.course_code;

-- 3. Enrollment count by course
SELECT
    c.course_code,
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
JOIN course_offerings co ON co.course_id = c.course_id
LEFT JOIN enrollments e ON e.offering_id = co.offering_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY enrollment_count DESC, c.course_code;

-- 4. Enrollment count by department
SELECT
    d.department_code,
    d.department_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM departments d
JOIN courses c ON c.department_id = d.department_id
JOIN course_offerings co ON co.course_id = c.course_id
LEFT JOIN enrollments e ON e.offering_id = co.offering_id
GROUP BY d.department_id, d.department_code, d.department_name
ORDER BY enrollment_count DESC;

-- 5. Average grade by course
SELECT
    c.course_code,
    c.course_name,
    ROUND(AVG(g.grade_points), 2) AS average_grade_points,
    ROUND(AVG(g.numeric_score), 2) AS average_numeric_score
FROM courses c
JOIN course_offerings co ON co.course_id = c.course_id
JOIN enrollments e ON e.offering_id = co.offering_id
JOIN grades g ON g.enrollment_id = e.enrollment_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY average_grade_points DESC;

-- 6. Average GPA by student
SELECT
    s.university_id,
    s.first_name || ' ' || s.last_name AS student_name,
    ROUND(SUM(g.grade_points * c.credit_hours) / SUM(c.credit_hours), 2) AS gpa
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN grades g ON g.enrollment_id = e.enrollment_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
GROUP BY s.student_id, s.university_id, student_name
ORDER BY gpa DESC;

-- 7. Instructor teaching workload
SELECT
    i.employee_number,
    i.first_name || ' ' || i.last_name AS instructor_name,
    d.department_code,
    COUNT(DISTINCT co.offering_id) AS sections_taught,
    COUNT(e.enrollment_id) AS total_students,
    (
        SELECT COALESCE(SUM(c2.credit_hours), 0)
        FROM course_offerings co2
        JOIN courses c2 ON c2.course_id = co2.course_id
        WHERE co2.instructor_id = i.instructor_id
    ) AS scheduled_credit_hours
FROM instructors i
JOIN departments d ON d.department_id = i.department_id
LEFT JOIN course_offerings co ON co.instructor_id = i.instructor_id
LEFT JOIN enrollments e ON e.offering_id = co.offering_id
GROUP BY i.instructor_id, i.employee_number, instructor_name, d.department_code
ORDER BY sections_taught DESC, total_students DESC;

-- 8. Students at risk with GPA below 2.0
WITH student_gpa AS (
    SELECT
        s.student_id,
        s.university_id,
        s.first_name || ' ' || s.last_name AS student_name,
        ROUND(SUM(g.grade_points * c.credit_hours) / SUM(c.credit_hours), 2) AS gpa
    FROM students s
    JOIN enrollments e ON e.student_id = s.student_id
    JOIN grades g ON g.enrollment_id = e.enrollment_id
    JOIN course_offerings co ON co.offering_id = e.offering_id
    JOIN courses c ON c.course_id = co.course_id
    GROUP BY s.student_id, s.university_id, student_name
)
SELECT university_id, student_name, gpa
FROM student_gpa
WHERE gpa < 2.0
ORDER BY gpa ASC;

-- 9. Full course schedule
SELECT
    sem.semester_name,
    sem.academic_year,
    c.course_code,
    c.course_name,
    co.section_number,
    i.first_name || ' ' || i.last_name AS instructor_name,
    co.schedule_day,
    co.schedule_time,
    co.room,
    co.capacity
FROM course_offerings co
JOIN courses c ON c.course_id = co.course_id
JOIN instructors i ON i.instructor_id = co.instructor_id
JOIN semesters sem ON sem.semester_id = co.semester_id
ORDER BY sem.start_date, c.course_code, co.section_number;

-- 10. Department performance summary
SELECT
    d.department_code,
    d.department_name,
    COUNT(DISTINCT s.student_id) AS student_count,
    COUNT(DISTINCT c.course_id) AS course_count,
    COUNT(DISTINCT co.offering_id) AS offering_count,
    ROUND(AVG(g.grade_points), 2) AS average_grade_points
FROM departments d
LEFT JOIN students s ON s.department_id = d.department_id
LEFT JOIN courses c ON c.department_id = d.department_id
LEFT JOIN course_offerings co ON co.course_id = c.course_id
LEFT JOIN enrollments e ON e.offering_id = co.offering_id
LEFT JOIN grades g ON g.enrollment_id = e.enrollment_id
GROUP BY d.department_id, d.department_code, d.department_name
ORDER BY average_grade_points DESC;
