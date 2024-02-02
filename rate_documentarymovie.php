<?php
if (isset($_GET['documentaryId']) && isset($_GET['rating'])) {
    $documentaryId = $_GET['documentaryId'];
    $rating = intval($_GET['rating']);

    try {
        $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $pdo->prepare("UPDATE documentary_movie_data SET sum_ratings = sum_ratings + ?, total_ratings = total_ratings + 1 WHERE id = ?");
        $stmt->execute([$rating, $documentaryId]);

        $stmt = $pdo->prepare("SELECT sum_ratings, total_ratings FROM documentary_movie_data WHERE id = ?");
        $stmt->execute([$documentaryId]);
        $updatedData = $stmt->fetch(PDO::FETCH_ASSOC);

        echo json_encode($updatedData);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Error connecting to the database: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['error' => 'Invalid request']);
}
