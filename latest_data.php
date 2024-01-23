<?php
try {
    // Connect to the database (replace with your actual database details)
    $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch the latest data from the database
    $latestData = $pdo->query("SELECT * FROM movie_data ORDER BY id DESC LIMIT 1")->fetch(PDO::FETCH_ASSOC);

    // Construct the image URLs
    $posterImageUrl = 'http://localhost/sia/uploads/pic1/' . $latestData['pic'];
    $logoImageUrl = 'http://localhost/sia/uploads/logo1/' . $latestData['logo'];

    // Add the image URLs to the response with 'pic' and 'logo' keys
    $latestData['pic'] = $posterImageUrl;
    $latestData['logo'] = $logoImageUrl;

    // Send the latest data back to the client as JSON
    echo json_encode($latestData);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Error connecting to the database: ' . $e->getMessage()]);
}
