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
