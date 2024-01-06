<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "sia_db"; // Replace with your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form was submitted as User or Admin
if (isset($_POST['user_signup'])) {
    // Get form data
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Insert data into the database for User
    $sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        // Redirect to loginuser.html
        header("Location: loginuser.html");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} elseif (isset($_POST['admin_signup'])) {
    // Handle Admin signup if needed
    // Add your admin signup logic here
}

// Close the database connection
$conn->close();
