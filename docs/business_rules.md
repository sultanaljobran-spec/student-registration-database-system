# Business Rules

1. Each student belongs to one department.
2. Each instructor belongs to one department.
3. Each course belongs to one department.
4. A course can be offered in many semesters.
5. Each course offering is taught by one instructor.
6. A student can enroll in many course offerings.
7. A course offering can have many students.
8. Each enrollment can have one final grade.
9. A student cannot enroll in the same course offering twice.
10. Course credits must be positive.
11. Enrollment status must be Enrolled, Completed, Withdrawn, or Failed.
12. A semester start date must be earlier than its end date.
13. A course offering must have a positive capacity.
14. Student, instructor, course, and department codes must be unique where applicable.

## Business Meaning

The system separates catalog data from scheduled classes. A course such as Database Systems exists once in the course catalog, while course offerings represent specific sections of that course in a semester. Enrollments connect students to those offerings, and grades connect final academic outcomes to completed or failed enrollments.
