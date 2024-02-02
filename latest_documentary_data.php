<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

try {
    $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->prepare("SELECT * FROM documentary_movie_data ORDER BY id DESC");
    $stmt->execute();
    $latestData = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($latestData as $key => $item) {
        $posterImageUrl = 'http://localhost/sia/uploads/pic1/' . $item['pic'];
        $logoImageUrl = 'http://localhost/sia/uploads/logo1/' . $item['logo'];

        $latestData[$key]['pic'] = $posterImageUrl;
        $latestData[$key]['logo'] = $logoImageUrl;
    }

    echo json_encode($latestData);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Error connecting to the database: ' . $e->getMessage()]);
    exit;
}
