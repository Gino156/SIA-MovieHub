<?php
session_start();

// Database credentials
$servername = "localhost";
$dbUsername = "root";
$dbPassword = "";
$database = "sia_db";

// Create connection
$conn = new mysqli($servername, $dbUsername, $dbPassword, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['user_login'])) {
    $username = $_POST['username'];
    $password = $_POST['password']; // Assuming password is already hashed

    // Prepared statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Set the user's ID in the session
        $_SESSION['userId'] = $user['user_id'];

        // Redirect to the main page after successful login
        header("Location: index.html");
        exit();
    } else {
        // User not found or password mismatch
        $error_message = "Incorrect username and/or password";
        header("Location: loginuser.html?error=" . urlencode($error_message));
        exit();
    }
}

// Close the database connection
$conn->close();
