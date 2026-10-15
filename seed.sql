-- ----------------------------------------------------------------------------
-- 1. SEED DEPARTMENTS
-- ----------------------------------------------------------------------------
INSERT OR IGNORE INTO `departments` (`department_id`, `department_name`, `location`) VALUES
(10, 'Executive Management', 'Nairobi - HQ') ,
(11, 'Human Resources',      'Nairobi - HQ'),
(12, 'Software Engineering', 'Nairobi - Tech Hub'),
(13, 'Finance & Operations', 'Mombasa Office');

-- ----------------------------------------------------------------------------
-- 2. SEED EMPLOYEES
-- ----------------------------------------------------------------------------
INSERT OR IGNORE INTO `employees` (`id`, `first_name`, `last_name`, `role`, `salary`, `hire_date`, `department_id`) VALUES
(1001, 'Alex',   'Morgan', 'Chief Executive Officer', 450000.00, '2018-01-15', 10),
(1002, 'Sarah',  'Jenkins','HR Manager',             280000.00, '2019-03-01', 11),
(1003, 'David',  'Chen',   'Lead Tech Architect',    320000.00, '2020-06-15', 12),
(1004, 'Julius', 'Mwangi', 'Senior Software Engineer', 260000.00, '2022-09-01', 12),
(1005, 'Amina',  'Hassan', 'Frontend Developer',     180000.00, '2023-02-10', 12);

-- ----------------------------------------------------------------------------
-- 3. SEED LEAVE TYPES
-- ----------------------------------------------------------------------------
INSERT OR IGNORE INTO `leave_types` (`id`, `name`, `default_days_per_year`, `is_paid`) VALUES
(1, 'Annual Leave',   21, 1),
(2, 'Sick Leave',     14, 1),
(3, 'Maternity Leave', 90, 1),
(4, 'Unpaid Leave',   30, 0);

-- ----------------------------------------------------------------------------
-- 4. SEED LEAVE REQUESTS
-- ----------------------------------------------------------------------------
INSERT OR IGNORE INTO `leave_requests` (`id`, `employee_id`, `leave_type_id`, `start_date`, `end_date`, `total_days`, `reason`) VALUES
(5001, 1004, 1, '2026-11-02 08:00:00', '2026-11-06 17:00:00', 5, 'Annual family vacation'),
(5002, 1005, 2, '2026-10-05 08:00:00', '2026-10-06 17:00:00', 2, 'Medical checkup and rest'),
(5003, 1004, 1, '2026-12-21 08:00:00', '2026-12-31 17:00:00', 9, 'End of year holidays');