import sqlite3

conn = sqlite3.connect("hr.db")
cursor = conn.cursor()

# GET ALL THE EMPLOYEES first_name, role and the department they belong in from DEPARTMENTS table
# You use a JOIN or INNER JOIN statement
print("All employees and the department they are in")
cursor.execute("""
    SELECT 
        employees.first_name,
        employees.role,
        departments.department_name
    FROM employees 
    JOIN departments
    ON employees.department_id = departments.department_id
""")
data = cursor.fetchall()
for row in data: print(row)
print("-------------------------------------------")

# Get all departments and the number of employees in each department
print("All departments together with the number of employees in each department")
cursor.execute("""
    SELECT departments.department_id, departments.department_name,
    COUNT(*) AS "No. of Employees"
    FROM departments 
    LEFT JOIN employees
    ON employees.department_id = departments.department_id
    GROUP BY departments.department_id
""")
data = cursor.fetchall()
for row in data: print(row)
print("-------------------------------------------")

cursor.execute("""
    INSERT INTO departments(department_id, department_name, location)
    VALUES(?, ?, ?)
""", (18, "Security", "Nairobi HQ"))

# A subquery for get data of employees and leave_request based on the leave type
print("Useing subquery to get employees with a apecific leave request type")
cursor.execute("""
    SELECT 
        employees.first_name,
        employees.role,
        leave_requests.start_date,
        leave_requests.end_date
    FROM employees 
    JOIN leave_requests
    ON leave_requests.employee_id = employees.id
    WHERE leave_requests.leave_type_id IN (
        SELECT id FROM leave_types WHERE leave_types.name = ?
    )
""", ("Annual Leave",))
data = cursor.fetchall()
for row in data: print(row)
print("-------------------------------------------")

# Combining a tables with many-to-many relationship through an intermediary table
print("Data from different table that have a many-to-many relationship through an intermediary table")
cursor.execute("""
    SELECT 
        employees.first_name, 
        employees.role, leave_types.name, 
        leave_requests.start_date,
        leave_requests.end_date
    FROM employees
    JOIN leave_requests ON leave_requests.employee_id = employees.id
    JOIN leave_types ON leave_types.id = leave_requests.leave_type_id
""")
data = cursor.fetchall()
for row in data: print(row)
print("-------------------------------------------")

cursor.close()