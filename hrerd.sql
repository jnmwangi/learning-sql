-- Active: 1749798357997@@127.0.0.1@5433
CREATE TABLE IF NOT EXISTS `emplooyees` (
  `id` integer PRIMARY KEY,
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NOT NULL,
  `role` TEXT NOT NULL,
  `salary` REAL NOT NULL,
  `hire_date` DATE NOT NULL,
  `department_id` integer NOT NULL
);

CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` INTEGER PRIMARY KEY,
  `department_name` text NOT NULL,
  `location` TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS `leave_requests` (
  `id` intenger PRIMARY KEY,
  `employee_id` integer,
  `leave_type_id` integer,
  `start_date` datetime,
  `end_date` datetime,
  `total_days` Integer,
  `reason` Text
);

CREATE TABLE IF NOT EXISTS `leave_types` (
  `id` integer PRIMARY KEY,
  `name` text,
  `default_days_per_year` integer,
  `is_paid` bool
);

