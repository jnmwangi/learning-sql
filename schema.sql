-- Create the Departments table
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name TEXT NOT NULL UNIQUE,
    location TEXT NOT NULL
);

-- Create the Employees table
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    role TEXT NOT NULL,
    salary REAL NOT NULL,
    hire_date DATE NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Seed Departments
INSERT INTO departments (department_name, location) VALUES 
('Engineering', 'Nairobi HQ'),
('Data Science', 'Mombasa Branch'),
('Product Management', 'Nairobi HQ'),
('Marketing', 'Remote');

-- Seed Employees
INSERT INTO employees (first_name, last_name, role, salary, hire_date, department_id) VALUES 
('John', 'Doe', 'Software Engineer', 75000.00, '2024-03-15', 1),
('Jane', 'Smith', 'Data Scientist', 82000.00, '2023-11-10', 2),
('Alex', 'Mwangi', 'Frontend Developer', 60000.00, '2025-01-20', 1),
('Grace', 'Achieng', 'Product Manager', 95000.00, '2022-06-01', 3),
('Michael', 'Brown', 'Backend Engineer', 78000.00, '2024-08-12', 1),
('Sarah', 'Wanjiku', 'Data Analyst', 55000.00, '2025-02-14', 2),
('David', 'Ochieng', 'Marketing Specialist', 48000.00, '2024-05-22', 4),
('Alice', 'Kamau', 'DevOps Engineer', 88000.00, '2023-04-19', 1);
