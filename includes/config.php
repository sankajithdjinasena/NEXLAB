<?php
/**
 * SURAS — Global configuration
 * Smart University Resource Allocation System
 */

// ---- Database credentials -------------------------------------------------
define('DB_HOST', 'localhost');
define('DB_NAME', 'suras');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_CHARSET', 'utf8mb4');

// ---- Application settings --------------------------------------------------
define('APP_NAME', 'SURAS');
define('APP_FULL_NAME', 'Smart University Resource Allocation System');
define('BASE_URL', '/'); // change to a sub-path if SURAS is not hosted at the web root

// ---- Session ----------------------------------------------------------------
// Hardened session cookie settings — must run before session_start().
if (session_status() === PHP_SESSION_NONE) {
    session_set_cookie_params([
        'lifetime' => 0,
        'path'     => '/',
        'httponly' => true,
        'samesite' => 'Lax',
    ]);
    session_start();
}

// ---- Error reporting (toggle off in production) -----------------------------
define('APP_DEBUG', true);
if (APP_DEBUG) {
    ini_set('display_errors', 1);
    error_reporting(E_ALL);
} else {
    ini_set('display_errors', 0);
    error_reporting(0);
}
