from pathlib import Path
import csv
import sqlite3


ROOT_DIR = Path(__file__).resolve().parents[1]
DB_PATH = ROOT_DIR / "database" / "student_registration.db"
OUTPUT_DIR = ROOT_DIR / "output"


REPORTS = {
    "student_transcript_report.csv": """
        SELECT
            s.university_id,
            s.first_name || ' ' || s.last_name AS student_name,
            d.department_code,
            sem.semester_name,
            sem.academic_year,
            c.course_code,
            c.course_name,
            c.credit_hours,
            e.status,
            COALESCE(g.letter_grade, '') AS letter_grade,
            COALESCE(g.grade_points, '') AS grade_points
        FROM students s
        JOIN departments d ON d.department_id = s.department_id
        JOIN enrollments e ON e.student_id = s.student_id
        JOIN course_offerings co ON co.offering_id = e.offering_id
        JOIN courses c ON c.course_id = co.course_id
        JOIN semesters sem ON sem.semester_id = co.semester_id
        LEFT JOIN grades g ON g.enrollment_id = e.enrollment_id
        ORDER BY s.university_id, sem.start_date, c.course_code;
    """,
    "course_enrollment_report.csv": """
        SELECT
            sem.semester_name,
            sem.academic_year,
            c.course_code,
            c.course_name,
            co.section_number,
            co.capacity,
            COUNT(e.enrollment_id) AS enrolled_students,
            co.capacity - COUNT(e.enrollment_id) AS available_seats
        FROM course_offerings co
        JOIN courses c ON c.course_id = co.course_id
        JOIN semesters sem ON sem.semester_id = co.semester_id
        LEFT JOIN enrollments e ON e.offering_id = co.offering_id
        GROUP BY co.offering_id, sem.semester_name, sem.academic_year,
                 c.course_code, c.course_name, co.section_number, co.capacity
        ORDER BY sem.start_date, c.course_code, co.section_number;
    """,
    "department_performance_report.csv": """
        SELECT
            d.department_code,
            d.department_name,
            COUNT(DISTINCT s.student_id) AS student_count,
            COUNT(DISTINCT c.course_id) AS course_count,
            COUNT(DISTINCT co.offering_id) AS offering_count,
            ROUND(AVG(g.grade_points), 2) AS average_grade_points,
            ROUND(AVG(g.numeric_score), 2) AS average_numeric_score
        FROM departments d
        LEFT JOIN students s ON s.department_id = d.department_id
        LEFT JOIN courses c ON c.department_id = d.department_id
        LEFT JOIN course_offerings co ON co.course_id = c.course_id
        LEFT JOIN enrollments e ON e.offering_id = co.offering_id
        LEFT JOIN grades g ON g.enrollment_id = e.enrollment_id
        GROUP BY d.department_id, d.department_code, d.department_name
        ORDER BY average_grade_points DESC;
    """,
    "instructor_workload_report.csv": """
        SELECT
            i.employee_number,
            i.first_name || ' ' || i.last_name AS instructor_name,
            d.department_code,
            i.title,
            COUNT(DISTINCT co.offering_id) AS sections_taught,
            COUNT(e.enrollment_id) AS total_enrollments,
            COUNT(DISTINCT co.semester_id) AS semesters_taught
        FROM instructors i
        JOIN departments d ON d.department_id = i.department_id
        LEFT JOIN course_offerings co ON co.instructor_id = i.instructor_id
        LEFT JOIN enrollments e ON e.offering_id = co.offering_id
        GROUP BY i.instructor_id, i.employee_number, instructor_name, d.department_code, i.title
        ORDER BY sections_taught DESC, total_enrollments DESC;
    """,
}


def export_report(connection: sqlite3.Connection, filename: str, query: str) -> None:
    cursor = connection.execute(query)
    rows = cursor.fetchall()
    columns = [description[0] for description in cursor.description]
    output_path = OUTPUT_DIR / filename

    with output_path.open("w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(columns)
        writer.writerows(rows)

    print(f"Exported {len(rows)} rows to {output_path}")


def main() -> None:
    if not DB_PATH.exists():
        raise FileNotFoundError(
            f"Database not found at {DB_PATH}. Run scripts/create_database.py first."
        )

    OUTPUT_DIR.mkdir(exist_ok=True)

    with sqlite3.connect(DB_PATH) as connection:
        connection.execute("PRAGMA foreign_keys = ON;")
        for filename, query in REPORTS.items():
            export_report(connection, filename, query)


if __name__ == "__main__":
    main()
