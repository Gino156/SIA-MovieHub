<?php
// Assume you have a database connection established

// Perform a query to fetch data from the database
$sql = "SELECT * FROM movie_data";
$result = $conn->query($sql);

// Check if there are rows in the result
if ($result->num_rows > 0) {
    // Fetch the data and convert it to an array
    $movieData = array();
    while ($row = $result->fetch_assoc()) {
        $movieData[] = $row;
    }

    // Output the data as JSON
    header('Content-Type: application/json');
    echo json_encode($movieData);
} else {
    echo json_encode(array()); // Return an empty array if no data is found
}

// Close the database connection
$conn->close();
