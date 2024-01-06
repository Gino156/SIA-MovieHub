<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "sia_db"; 

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['user_login'])) {
    // Get form data
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if the user exists
    $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // User found, redirect to index page
        header("Location: index.html");
        exit();
    } else {
        // User not found, redirect to login page with specific error message
        $error_message = "Incorrect username and password";
        header("Location: loginuser.html?error=" . urlencode($error_message));
        exit();
    }
    
}

// Close the database connection
$conn->close();
?>
