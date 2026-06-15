PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS course_offerings;
DROP TABLE IF EXISTS semesters;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_code TEXT NOT NULL UNIQUE,
    department_name TEXT NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    university_id TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    gender TEXT NOT NULL CHECK (gender IN ('Female', 'Male', 'Other')),
    date_of_birth TEXT NOT NULL,
    department_id INTEGER NOT NULL,
    enrollment_year INTEGER NOT NULL CHECK (enrollment_year BETWEEN 2000 AND 2100),
    status TEXT NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive', 'Graduated', 'Suspended')),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE instructors (
    instructor_id INTEGER PRIMARY KEY,
    employee_number TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    department_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_code TEXT NOT NULL UNIQUE,
    course_name TEXT NOT NULL,
    credit_hours INTEGER NOT NULL CHECK (credit_hours > 0),
    department_id INTEGER NOT NULL,
    course_level INTEGER NOT NULL CHECK (course_level BETWEEN 100 AND 599),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE semesters (
    semester_id INTEGER PRIMARY KEY,
    semester_name TEXT NOT NULL,
    academic_year TEXT NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    UNIQUE (semester_name, academic_year),
    CHECK (date(start_date) < date(end_date))
);

CREATE TABLE course_offerings (
    offering_id INTEGER PRIMARY KEY,
    course_id INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,
    semester_id INTEGER NOT NULL,
    section_number TEXT NOT NULL,
    capacity INTEGER NOT NULL CHECK (capacity > 0),
    schedule_day TEXT NOT NULL CHECK (schedule_day IN ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday')),
    schedule_time TEXT NOT NULL,
    room TEXT NOT NULL,
    UNIQUE (course_id, semester_id, section_number),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
    FOREIGN KEY (semester_id) REFERENCES semesters(semester_id)
);

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    offering_id INTEGER NOT NULL,
    enrollment_date TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Enrolled', 'Completed', 'Withdrawn', 'Failed')),
    UNIQUE (student_id, offering_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (offering_id) REFERENCES course_offerings(offering_id)
);

CREATE TABLE grades (
    grade_id INTEGER PRIMARY KEY,
    enrollment_id INTEGER NOT NULL UNIQUE,
    letter_grade TEXT NOT NULL CHECK (letter_grade IN ('A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F')),
    grade_points REAL NOT NULL CHECK (grade_points BETWEEN 0.0 AND 4.0),
    numeric_score REAL NOT NULL CHECK (numeric_score BETWEEN 0.0 AND 100.0),
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);

CREATE INDEX idx_students_department ON students(department_id);
CREATE INDEX idx_instructors_department ON instructors(department_id);
CREATE INDEX idx_courses_department ON courses(department_id);
CREATE INDEX idx_offerings_course ON course_offerings(course_id);
CREATE INDEX idx_offerings_semester ON course_offerings(semester_id);
CREATE INDEX idx_offerings_instructor ON course_offerings(instructor_id);
CREATE INDEX idx_enrollments_student ON enrollments(student_id);
CREATE INDEX idx_enrollments_offering ON enrollments(offering_id);
CREATE INDEX idx_grades_enrollment ON grades(enrollment_id);
