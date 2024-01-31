<?php
session_start();

// Database connection parameters
$host = 'localhost';
$dbUsername = 'root';
$dbPassword = ''; // Assuming no password
$dbName = 'sia_db';

// Create a new database connection
$conn = new mysqli($host, $dbUsername, $dbPassword, $dbName);

// Check for a successful database connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted and the session contains the admin ID
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_SESSION['admin_id'])) {
    // Sanitize and validate input
    $username = $conn->real_escape_string(trim($_POST['username']));
    $email = $conn->real_escape_string(trim($_POST['email']));
    $newPassword = $_POST['new_password']; // Password will be hashed, no need to escape
    $adminId = $_SESSION['admin_id'];
    $adminImage = '';

    // Handle image upload
    if (isset($_FILES['adminImage']) && $_FILES['adminImage']['error'] == 0) {
        $target_dir = "uploads/";
        $target_file = $target_dir . basename($_FILES["adminImage"]["name"]);

        // Validate and move the uploaded file
        if (move_uploaded_file($_FILES["adminImage"]["tmp_name"], $target_file)) {
            $adminImage = $target_file; // File path to be stored in database
        } else {
            echo json_encode(["message" => "Error uploading file."]);
            exit;
        }
    }

    // Hash the new password
    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

    // Prepare SQL statement to update admin data
    $stmt = $conn->prepare("UPDATE admins SET username = ?, email = ?, password = ?, admin_image = ? WHERE id = ?");
    $stmt->bind_param("ssssi", $username, $email, $hashedPassword, $adminImage, $adminId);

    // Execute the prepared statement
    if ($stmt->execute()) {
        echo json_encode(["message" => "Profile updated successfully."]);
    } else {
        echo json_encode(["message" => "Error updating profile: " . $stmt->error]);
    }

    // Close statement and database connection
    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["message" => "Invalid request or session expired."]);
    exit;
}
