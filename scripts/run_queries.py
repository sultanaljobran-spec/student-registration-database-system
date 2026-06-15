from pathlib import Path
import sqlite3
from textwrap import shorten


ROOT_DIR = Path(__file__).resolve().parents[1]
DB_PATH = ROOT_DIR / "database" / "student_registration.db"


QUERIES = {
    "Student GPA Ranking": """
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
        ORDER BY gpa DESC
        LIMIT 10;
    """,
    "Course Enrollment Counts": """
        SELECT
            c.course_code,
            c.course_name,
            COUNT(e.enrollment_id) AS enrollment_count
        FROM courses c
        JOIN course_offerings co ON co.course_id = c.course_id
        LEFT JOIN enrollments e ON e.offering_id = co.offering_id
        GROUP BY c.course_id, c.course_code, c.course_name
        ORDER BY enrollment_count DESC, c.course_code
        LIMIT 10;
    """,
    "Instructor Workload": """
        SELECT
            i.employee_number,
            i.first_name || ' ' || i.last_name AS instructor_name,
            COUNT(DISTINCT co.offering_id) AS sections_taught,
            COUNT(e.enrollment_id) AS total_students
        FROM instructors i
        LEFT JOIN course_offerings co ON co.instructor_id = i.instructor_id
        LEFT JOIN enrollments e ON e.offering_id = co.offering_id
        GROUP BY i.instructor_id, i.employee_number, instructor_name
        ORDER BY sections_taught DESC, total_students DESC;
    """,
    "At-Risk Students": """
        WITH student_gpa AS (
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
        )
        SELECT university_id, student_name, gpa
        FROM student_gpa
        WHERE gpa < 2.0
        ORDER BY gpa ASC;
    """,
}


def print_rows(title: str, cursor: sqlite3.Cursor) -> None:
    rows = cursor.fetchall()
    columns = [description[0] for description in cursor.description]
    print(f"\n{title}")
    print("=" * len(title))

    if not rows:
        print("No rows returned.")
        return

    widths = []
    for index, column in enumerate(columns):
        values = [str(row[index]) for row in rows]
        widths.append(min(max(len(column), *(len(value) for value in values)), 32))

    header = " | ".join(column.ljust(widths[index]) for index, column in enumerate(columns))
    print(header)
    print("-" * len(header))

    for row in rows:
        print(
            " | ".join(
                shorten(str(value), width=widths[index], placeholder="...")
                .ljust(widths[index])
                for index, value in enumerate(row)
            )
        )


def main() -> None:
    if not DB_PATH.exists():
        raise FileNotFoundError(
            f"Database not found at {DB_PATH}. Run scripts/create_database.py first."
        )

    with sqlite3.connect(DB_PATH) as connection:
        connection.execute("PRAGMA foreign_keys = ON;")
        for title, query in QUERIES.items():
            cursor = connection.execute(query)
            print_rows(title, cursor)


if __name__ == "__main__":
    main()
