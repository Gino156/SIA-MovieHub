<?php
// Enable error reporting for debugging (disable in production)
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Check if the movie ID is provided
if (!isset($_GET['movieId'])) {
    echo json_encode(['error' => 'No movie ID provided']);
    exit;
}

$movieId = $_GET['movieId'];

// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$database = "sia_db";

try {
    // Create PDO connection
    $pdo = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Prepare SQL query
    $stmt = $pdo->prepare("SELECT * FROM movie_data WHERE id = :movieId");
    $stmt->bindParam(':movieId', $movieId, PDO::PARAM_INT);

    // Execute the query
    $stmt->execute();

    // Check if the movie exists
    if ($stmt->rowCount() > 0) {
        // Fetch the movie details
        $movieDetails = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode($movieDetails);
    } else {
        // No movie found
        echo json_encode(['error' => 'Movie not found']);
    }
} catch (PDOException $e) {
    // Handle database connection error
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}

// Close connection
$pdo = null;
