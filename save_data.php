<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate and sanitize input data
    $logo = $_FILES['logo']['name'];
    $description = htmlspecialchars($_POST['description']);
    $pic = $_FILES['pic']['name'];
    $title = htmlspecialchars($_POST['title']);
    $release = htmlspecialchars($_POST['release']);
    $director = htmlspecialchars($_POST['director']);
    $cast = htmlspecialchars($_POST['cast']);
    $link = htmlspecialchars($_POST['link']);

    // Move uploaded files to a designated folder (if needed)
    // ... (Your existing code for handling file uploads)

    // Connect to the database
    try {
        $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Prepare and execute the SQL query to insert data
        $sql = "INSERT INTO movie_data (logo, description, pic, title, release_date, director, cast, video_link)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$logo, $description, $pic, $title, $release, $director, $cast, $link]);

        // Fetch the latest data from the database
        $latestData = $pdo->query("SELECT * FROM movie_data ORDER BY id DESC LIMIT 1")->fetch(PDO::FETCH_ASSOC);

        // Send the latest data back to the client as JSON
        echo json_encode($latestData);
    } catch (PDOException $e) {
        echo "Error connecting to the database: " . $e->getMessage();
    }
} else {
    // If the request method is not POST, redirect or handle accordingly
    header("Location: index.html"); // You can redirect to the homepage or any other page
}
