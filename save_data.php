<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        // Validate and sanitize input data
        $logo = $_FILES['logo']['name'];
        $description = htmlspecialchars($_POST['description']);
        $pic = $_FILES['pic']['name'];
        $title = htmlspecialchars($_POST['title']);
        $release = htmlspecialchars($_POST['release']);
        $director = htmlspecialchars($_POST['director']);
        $cast = htmlspecialchars($_POST['cast']);
        $link = htmlspecialchars($_POST['link']);

        // Directory to store logo and pic
        $logoDirectory = "uploads/logo1/";
        $picDirectory = "uploads/pic1/";

        // Ensure the directories exist, create them if not
        if (!file_exists($logoDirectory)) {
            mkdir($logoDirectory, 0755, true);
        }
        if (!file_exists($picDirectory)) {
            mkdir($picDirectory, 0755, true);
        }

        // Move uploaded logo and pic files to designated folders
        move_uploaded_file($_FILES['logo']['tmp_name'], $logoDirectory . $logo);
        move_uploaded_file($_FILES['pic']['tmp_name'], $picDirectory . $pic);

        // Connect to the database (replace with your actual database details)
        $pdo = new PDO("mysql:host=localhost;dbname=sia_db", "root", "");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Prepare and execute the SQL query to insert data
        $sql = "INSERT INTO movie_data (logo, description, pic, title, release_date, director, cast, video_link)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$logo, $description, $pic, $title, $release, $director, $cast, $link]);

        // Construct the image URL
        $imageUrl = 'http://localhost/sia/' . $picDirectory . $pic;

        // Fetch the latest data from the database
        $latestData = $pdo->query("SELECT * FROM movie_data ORDER BY id DESC LIMIT 1")->fetch(PDO::FETCH_ASSOC);

        // Add the constructed image URL and YouTube video link to the response
        $latestData['pic'] = $imageUrl;
        $latestData['video_link'] = $link;

        // Send the latest data back to the client as JSON
        echo json_encode($latestData);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Error connecting to the database: ' . $e->getMessage()]);
    }
} else {
    // If the request method is not POST, return an error response
    echo json_encode(['error' => 'Invalid request method']);
}
