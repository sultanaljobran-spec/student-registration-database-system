# Data Dictionary

## departments

| Column | Description |
|---|---|
| department_id | Primary key for each department. |
| department_code | Unique short code such as CS or IS. |
| department_name | Full department name. |

## students

| Column | Description |
|---|---|
| student_id | Primary key for each student. |
| university_id | Unique university-issued student identifier. |
| first_name | Student first name. |
| last_name | Student last name. |
| email | Unique student email address. |
| gender | Student gender value. |
| date_of_birth | Student birth date. |
| department_id | Foreign key to departments. |
| enrollment_year | Year the student entered the university. |
| status | Student academic status. |

## instructors

| Column | Description |
|---|---|
| instructor_id | Primary key for each instructor. |
| employee_number | Unique university employee number. |
| first_name | Instructor first name. |
| last_name | Instructor last name. |
| email | Unique instructor email address. |
| department_id | Foreign key to departments. |
| title | Academic title or rank. |

## courses

| Column | Description |
|---|---|
| course_id | Primary key for each course. |
| course_code | Unique catalog code such as CS301. |
| course_name | Course title. |
| credit_hours | Number of credit hours. Must be positive. |
| department_id | Foreign key to departments. |
| course_level | Catalog level such as 100, 200, 300, or 400. |

## semesters

| Column | Description |
|---|---|
| semester_id | Primary key for each semester. |
| semester_name | Semester label such as Fall or Spring. |
| academic_year | Academic year label. |
| start_date | First date of the semester. |
| end_date | Last date of the semester. |

## course_offerings

| Column | Description |
|---|---|
| offering_id | Primary key for each scheduled course section. |
| course_id | Foreign key to courses. |
| instructor_id | Foreign key to instructors. |
| semester_id | Foreign key to semesters. |
| section_number | Section identifier for the course in a semester. |
| capacity | Maximum number of students. |
| schedule_day | Day of the week when the section meets. |
| schedule_time | Meeting time range. |
| room | Assigned classroom. |

## enrollments

| Column | Description |
|---|---|
| enrollment_id | Primary key for each enrollment. |
| student_id | Foreign key to students. |
| offering_id | Foreign key to course_offerings. |
| enrollment_date | Date when the student enrolled. |
| status | Enrollment status: Enrolled, Completed, Withdrawn, or Failed. |

## grades

| Column | Description |
|---|---|
| grade_id | Primary key for each grade record. |
| enrollment_id | Unique foreign key to enrollments. |
| letter_grade | Final letter grade. |
| grade_points | Numeric grade points on a 4.0 scale. |
| numeric_score | Final numeric score from 0 to 100. |
