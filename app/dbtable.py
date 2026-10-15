import sqlite3
from datetime import datetime

conn = sqlite3.connect("hr.db")

class Employee: # class name is the table name
    # instance attributes map to table columns
    def __init__(self, id:int, first_name:str, last_name:str, role:str, department_id, salary=0):
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.role = role
        self.department_id = department_id
        self.salary = salary
        self.hire_date = datetime.now().isoformat()

        self.create_table()

    def create_table(self):
        create_db_query = """
            CREATE TABLE IF NOT EXISTS `employees` (
                `id` integer PRIMARY KEY,
                `first_name` TEXT NOT NULL,
                `last_name` TEXT NOT NULL,
                `role` TEXT NOT NULL,
                `salary` REAL NOT NULL,
                `hire_date` DATE NOT NULL,
                `department_id` integer NOT NULL
            )
        """
        cursor = conn.cursor()
        cursor.execute(create_db_query)
        cursor.close()

    def save(self):
        insert_statement = """
            INSERT INTO employees(id, first_name, last_name, role,salary,hire_date,department_id)
            VALUES(:id, :first_name, :last_name, :role,:salary,:hire_date,:department_id)
        """
        cursor = conn.cursor()
        cursor.execute(insert_statement, self.__dict__)
        conn.commit()
        cursor.close()

    @classmethod
    def get_all(cls):
        select_statement = """
            SELECT * FROM employees
        """
        cursor = conn.cursor()
        results = cursor.execute(select_statement)
        data = results.fetchall()
        columns = cursor.description
        # print(columns)
        cursor.close()
        
        return [
            {columns[index][0]: val for index, val in enumerate(row)}
            for row in data
        ]



employee1 = Employee(1, "Julius", "Mwangi", "Admin", 1)
# employee1.save()