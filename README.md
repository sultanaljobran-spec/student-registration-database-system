# Student Registration Database System

A GitHub-ready database design project for a university student registration system. The project demonstrates relational modeling, SQL implementation, ERD documentation, normalization, sample reporting, and repeatable SQLite database setup.

## Technologies

- SQL
- SQLite
- Database Design
- ERD
- Normalization
- Data Modeling
- System Analysis

## Business Problem

Universities need a reliable way to manage students, departments, instructors, courses, semester-based course offerings, enrollments, and final grades. This database design reduces duplicate data, protects referential integrity, and supports academic reporting such as transcripts, course enrollment counts, GPA analysis, and instructor workload.

## Features

- Normalized relational schema for registration and grade management
- Primary keys, foreign keys, unique constraints, check constraints, and indexes
- Realistic sample data for departments, students, instructors, courses, offerings, enrollments, and grades
- SQL analysis queries for academic and administrative reporting
- Python scripts to create the database, run analysis queries, and export CSV reports
- Complete documentation for business rules, requirements, ERD, normalization, data dictionary, and query explanations

## Tech Stack

- SQL
- SQLite
- Python 3.10+
- Markdown

## Database Entities

- departments
- students
- instructors
- courses
- semesters
- course_offerings
- enrollments
- grades

## ERD

The database uses one-to-many relationships from departments to students, instructors, and courses. Courses become scheduled classes through course offerings. Students and course offerings have a many-to-many relationship resolved by the enrollments bridge table. Grades are stored separately so each enrollment can have zero or one final grade.

See [docs/erd.md](docs/erd.md) for the text-based ERD and relationship explanation.

## Normalization

The schema is designed in Third Normal Form:

- 1NF: Each field stores one value, and every table has a primary key.
- 2NF: Non-key attributes depend on the full primary key of their table.
- 3NF: Non-key attributes do not depend on other non-key attributes.

See [docs/normalization.md](docs/normalization.md) for details.

## SQL Analysis Examples

The project includes SQL for:

- Student transcript
- Current student enrollments
- Enrollment count by course and department
- Average grade by course
- GPA by student
- Instructor workload
- At-risk students below 2.0 GPA
- Full course schedule
- Department performance summary

See [database/queries.sql](database/queries.sql) and [docs/sql_queries_explained.md](docs/sql_queries_explained.md).

## How to Run

From the project root:

```bash
python scripts/create_database.py
python scripts/run_queries.py
python scripts/export_reports.py
```

The database is created at:

```text
database/student_registration.db
```

## Output Reports

CSV reports are exported to the `output/` folder:

- `student_transcript_report.csv`
- `course_enrollment_report.csv`
- `department_performance_report.csv`
- `instructor_workload_report.csv`

## Project Structure

```text
student-registration-database-system/
|-- README.md
|-- requirements.txt
|-- database/
|   |-- schema.sql
|   |-- sample_data.sql
|   |-- queries.sql
|   `-- student_registration.db
|-- scripts/
|   |-- create_database.py
|   |-- run_queries.py
|   `-- export_reports.py
|-- output/
|   |-- student_transcript_report.csv
|   |-- course_enrollment_report.csv
|   |-- department_performance_report.csv
|   `-- instructor_workload_report.csv
|-- docs/
|   |-- business_rules.md
|   |-- requirements.md
|   |-- normalization.md
|   |-- erd.md
|   |-- data_dictionary.md
|   `-- sql_queries_explained.md
`-- screenshots/
    `-- .gitkeep
```

## Screenshots

Add screenshots of the database tables, query outputs, or exported reports to the `screenshots/` folder.

## Future Improvements

- Add a simple command-line menu for report selection
- Add prerequisite tracking for courses
- Add tuition billing and payment records
- Add audit tables for enrollment changes
- Add automated tests for constraints and report queries

## Author

Prepared as an Information Systems graduate portfolio project.
