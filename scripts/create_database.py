from pathlib import Path
import sqlite3


ROOT_DIR = Path(__file__).resolve().parents[1]
DATABASE_DIR = ROOT_DIR / "database"
DB_PATH = DATABASE_DIR / "student_registration.db"
SCHEMA_PATH = DATABASE_DIR / "schema.sql"
SAMPLE_DATA_PATH = DATABASE_DIR / "sample_data.sql"


def execute_script(connection: sqlite3.Connection, script_path: Path) -> None:
    with script_path.open("r", encoding="utf-8") as file:
        connection.executescript(file.read())


def main() -> None:
    DATABASE_DIR.mkdir(exist_ok=True)

    with sqlite3.connect(DB_PATH) as connection:
        connection.execute("PRAGMA foreign_keys = ON;")
        execute_script(connection, SCHEMA_PATH)
        execute_script(connection, SAMPLE_DATA_PATH)
        connection.commit()

    print(f"Database created successfully: {DB_PATH}")


if __name__ == "__main__":
    main()
