<?php
session_start();

$movieId = isset($_POST['movieId']) ? $_POST['movieId'] : null;
$userId = isset($_SESSION['userId']) ? $_SESSION['userId'] : null;

// Debugging line to check if userId is set in the session
if (!$userId) {
    echo 'User not authenticated. Session userId not set.<br>';
    exit(json_encode(['error' => 'User not authenticated']));
}

$servername = "localhost";
$username = "root";
$password = "";
$database = "sia_db";
$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    echo json_encode(['error' => 'Connection failed: ' . $conn->connect_error]);
    exit;
}

$stmt = $conn->prepare("SELECT saved_movies FROM users WHERE user_id = ?");
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $savedMovies = json_decode($row['saved_movies'], true);

    if ($savedMovies === null) {
        $savedMovies = [];
    }

    if (!in_array($movieId, $savedMovies)) {
        array_push($savedMovies, $movieId);
        $savedMoviesJson = json_encode($savedMovies);
        $updateStmt = $conn->prepare("UPDATE users SET saved_movies = ? WHERE user_id = ?");
        $updateStmt->bind_param("si", $savedMoviesJson, $userId);

        if ($updateStmt->execute()) {
            echo json_encode(['success' => true]);
            exit;
        } else {
            echo json_encode(['success' => false, 'error' => $conn->error]);
            exit;
        }
    } else {
        echo json_encode(['success' => false, 'error' => 'Movie already saved']);
        exit;
    }
} else {
    echo json_encode(['success' => false, 'error' => 'User not found']);
    exit;
}

$conn->close();
