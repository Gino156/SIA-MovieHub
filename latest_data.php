<?php
try {
    // Connect to the database
    $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch all data from the database
    $latestData = $pdo->query("SELECT * FROM movie_data ORDER BY id DESC")->fetchAll(PDO::FETCH_ASSOC);

    // Iterate over each item and construct the image URLs
    foreach ($latestData as $key => $item) {
        $posterImageUrl = 'http://localhost/sia/uploads/pic1/' . $item['pic'];
        $logoImageUrl = 'http://localhost/sia/uploads/logo1/' . $item['logo'];

        // Add the image URLs to the response with 'pic' and 'logo' keys
        $latestData[$key]['pic'] = $posterImageUrl;
        $latestData[$key]['logo'] = $logoImageUrl;
    }

    // Send the latest data back to the client as JSON
    echo json_encode($latestData);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Error connecting to the database: ' . $e->getMessage()]);
}
