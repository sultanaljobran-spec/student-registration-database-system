# Requirements

## Functional Requirements

- Store department records with unique department codes.
- Store student demographic and academic program information.
- Store instructor employment and department information.
- Store course catalog records with credit hours and course level.
- Store semester records with academic year and date range.
- Store course offerings by semester, instructor, room, schedule, and capacity.
- Store student enrollments in course offerings.
- Store final grades for completed or failed enrollments.
- Generate student transcript reports.
- Generate course enrollment, department performance, and instructor workload reports.
- Provide a supporting dashboard interface for viewing academic performance indicators and report summaries.

## Systems Analysis Scope

- Model the academic registration workflow from department ownership through course offerings, student enrollments, and final grades.
- Separate course catalog data from semester-specific course offering data.
- Represent the many-to-many relationship between students and course offerings through the enrollments bridge table.
- Support administrative decision-making with SQL reports and dashboard summaries.
- Keep the Flask dashboard as a reporting interface over the database rather than the core system of record.

## Non-Functional Requirements

- Use SQLite so the project can run locally without cloud services.
- Use SQL constraints to protect data quality.
- Use indexes on frequently joined foreign key columns.
- Keep scripts simple and beginner-friendly.
- Keep documentation clear enough for GitHub portfolio review.

## Data Quality Requirements

- University IDs, emails, employee numbers, course codes, and department codes must be unique.
- Credit hours and course offering capacity must be positive.
- Enrollment status values must be controlled.
- Grade values must remain within valid letter, point, and numeric score ranges.
- Foreign keys must prevent orphaned records.
