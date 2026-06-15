# Entity Relationship Diagram

```text
departments
  PK department_id
  |
  |--< students
  |      PK student_id
  |      FK department_id
  |
  |--< instructors
  |      PK instructor_id
  |      FK department_id
  |
  `--< courses
         PK course_id
         FK department_id
         |
         `--< course_offerings >-- instructors
                PK offering_id     FK instructor_id
                FK course_id
                FK semester_id
                |
                >-- semesters
                |
                `--< enrollments >-- students
                       PK enrollment_id
                       FK student_id
                       FK offering_id
                       |
                       `-- grades
                            PK grade_id
                            FK enrollment_id
```

## Relationship Summary

- One department has many students.
- One department has many instructors.
- One department has many courses.
- One course has many course offerings.
- One semester has many course offerings.
- One instructor teaches many course offerings.
- One student has many enrollments.
- One course offering has many enrollments.
- One enrollment has zero or one grade.

## Many-to-Many Relationship

Students and course offerings have a many-to-many relationship:

- A student can take many course offerings.
- A course offering can include many students.

The enrollments table resolves this relationship. It acts as a bridge table and also stores enrollment-specific data such as enrollment date and enrollment status.
