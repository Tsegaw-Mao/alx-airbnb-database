import csv
import uuid
import mysql.connector
from mysql.connector import errorcode

# 1. Connect to MySQL server
def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password"
    )

# 2. Create database if not exists
def create_database(connection):
    cursor = connection.cursor()
    try:
        cursor.execute("CREATE DATABASE IF NOT EXISTS ALX_prodev")
        print("✅ Database ALX_prodev is ready.")
    except mysql.connector.Error as err:
        print(f"❌ Failed to create database: {err}")
    cursor.close()

# 3. Connect to ALX_prodev database
def connect_to_prodev():
    return mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="ALX_prodev"
    )

# 4. Create user_data table
def create_table(connection):
    cursor = connection.cursor()
    table_query = """
    CREATE TABLE IF NOT EXISTS user_data (
        user_id CHAR(36) PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        age DECIMAL NOT NULL,
        INDEX (user_id)
    );
    """
    try:
        cursor.execute(table_query)
        print("✅ Table user_data is ready.")
    except mysql.connector.Error as err:
        print(f"❌ Failed to create table: {err}")
    cursor.close()

# 5. Insert data from CSV
def insert_data(connection, data):
    cursor = connection.cursor()
    insert_query = """
    INSERT INTO user_data (user_id, name, email, age)
    VALUES (%s, %s, %s, %s)
    ON DUPLICATE KEY UPDATE name=VALUES(name), email=VALUES(email), age=VALUES(age);
    """
    try:
        cursor.executemany(insert_query, data)
        connection.commit()
        print(f"✅ Inserted {cursor.rowcount} rows.")
    except mysql.connector.Error as err:
        print(f"❌ Insert error: {err}")
    cursor.close()

# 6. Read CSV data
def read_csv(filepath):
    data = []
    with open(filepath, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            user_id = str(uuid.uuid4())
            name = row['name']
            email = row['email']
            age = row['age']
            data.append((user_id, name, email, age))
    return data

# 🚀 Main routine
if __name__ == "__main__":
    try:
        connection = connect_db()
        create_database(connection)
        connection.close()

        prodev_conn = connect_to_prodev()
        create_table(prodev_conn)

        data = read_csv('user_data.csv')
        insert_data(prodev_conn, data)

        prodev_conn.close()
        print("🎉 Done seeding the database.")
    except Exception as e:
        print(f"🔥 Error: {e}")
