<?php
session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');

$userId = isset($_SESSION['userId']) ? $_SESSION['userId'] : null;

if (!$userId) {
    echo json_encode(['error' => 'User not authenticated']);
    exit;
}

try {
    $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("SELECT saved_movies FROM users WHERE user_id = ?");
    $stmt->execute([$userId]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        $savedMovies = json_decode($result['saved_movies'], true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new Exception('JSON decoding error: ' . json_last_error_msg());
        }
        echo json_encode($savedMovies);
    } else {
        echo json_encode(['error' => 'No saved movies found']);
    }
} catch (PDOException $e) {
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
