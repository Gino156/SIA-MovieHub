<?php
if (isset($_GET['animeId']) && isset($_GET['rating'])) {
    $animeId = $_GET['animeId'];
    $rating = intval($_GET['rating']);

    try {
        $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $pdo->prepare("UPDATE anime_movie_data SET sum_ratings = sum_ratings + ?, total_ratings = total_ratings + 1 WHERE id = ?");
        $stmt->execute([$rating, $animeId]);

        $stmt = $pdo->prepare("SELECT sum_ratings, total_ratings FROM anime_movie_data WHERE id = ?");
        $stmt->execute([$animeId]);
        $updatedData = $stmt->fetch(PDO::FETCH_ASSOC);

        echo json_encode($updatedData);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Error connecting to the database: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['error' => 'Invalid request']);
}
