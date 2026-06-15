# Normalization

## First Normal Form

The design satisfies 1NF because each table has a primary key, each column stores one atomic value, and repeating groups are removed. For example, a student's course registrations are not stored as multiple course columns in the students table. They are stored as rows in the enrollments table.

## Second Normal Form

The design satisfies 2NF because non-key attributes depend on the full key of their table. Course information is stored in courses, semester information is stored in semesters, and student information is stored in students. The course_offerings table stores only information that describes a specific scheduled section.

## Third Normal Form

The design satisfies 3NF because non-key attributes do not depend on other non-key attributes. Department names are stored in departments instead of being repeated in students, instructors, or courses. Instructor details are stored in instructors instead of being repeated in every course offering.

## Redundancy Reduction

The database avoids redundancy by separating:

- departments from students, instructors, and courses
- courses from semester-specific offerings
- enrollments from students and course offerings
- grades from enrollment records

This structure makes updates safer. For example, changing a department name happens once in departments rather than across many student and course rows.
