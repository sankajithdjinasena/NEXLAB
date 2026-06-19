-- =========================================================
-- SURAS — database/suras.sql
-- Minimal schema to support index.php / login.php.
-- Extend with resources, bookings, waitlist, notifications,
-- and departments tables as those modules are built out.
-- =========================================================

CREATE DATABASE IF NOT EXISTS suras CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE suras;

CREATE TABLE IF NOT EXISTS users (
    id            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name     VARCHAR(120)        NOT NULL,
    email         VARCHAR(190)        NOT NULL UNIQUE,
    password_hash VARCHAR(255)        NOT NULL,
    role          ENUM('student','faculty','project_lead','admin') NOT NULL DEFAULT 'student',
    department    VARCHAR(120)        NULL,
    status        ENUM('active','suspended') NOT NULL DEFAULT 'active',
    created_at    TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- Sample accounts.
-- IMPORTANT: replace the placeholder hashes below before
-- using this in anything beyond local testing. Generate a
-- real hash in PHP with:
--   echo password_hash('your-password', PASSWORD_DEFAULT);
-- ---------------------------------------------------------
INSERT INTO users (full_name, email, password_hash, role, department) VALUES
('Harol Maxilan',  'harol.admin@university.edu',   '$2y$10$REPLACE_WITH_REAL_HASH_xxxxxxxxxxxxxxxxxxxxxx', 'admin',        'Resource Office'),
('Dr. A. Perera',  'a.perera@university.edu',      '$2y$10$REPLACE_WITH_REAL_HASH_xxxxxxxxxxxxxxxxxxxxxx', 'faculty',      'Computer Science'),
('Sankajith Jinasena', 'sankajith@university.edu', '$2y$10$REPLACE_WITH_REAL_HASH_xxxxxxxxxxxxxxxxxxxxxx', 'project_lead', 'Computer Science'),
('Mathurya Muralimohan', 'mathurya@university.edu', '$2y$10$REPLACE_WITH_REAL_HASH_xxxxxxxxxxxxxxxxxxxxxx', 'student',     'Computer Science');
