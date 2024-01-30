document.addEventListener('DOMContentLoaded', function() {
  // Fetch movie data from the server
  fetch('latest_data.php')
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      const container = document.querySelector('.container');

      // Iterate over each movie item received
      data.forEach(item => {
        const card = document.createElement('div');
        card.className = 'card';
        card.id = 'card-' + item.id;

        card.innerHTML = `
          <img src="${item.pic}" alt="Image">
          <div class="title">${item.title}</div>
          <div class="info">
            <span class="info-label">Release Date:</span> ${item.release_date}<br>
            <span class="info-label">Director:</span> ${item.director}<br>
            <span class="info-label">Cast:</span> ${item.cast}<br>
            <div class="rating-section">
              <span class="info-label">Rate:</span>
              <select class="rating-dropdown" id="rating-${item.id}" name="rating-${item.id}">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
              <span class="total-ratings">(${item.total_ratings} Ratings, ${item.sum_ratings} Total Points)</span>
            </div>
            <a href="${item.video_link}" target="_blank" class="btn-watch-trailer">Watch Trailer</a>
            <button class="save-movie-btn" data-movie-id="${item.id}">+</button>
          </div>`;

        container.appendChild(card);

        // Event listener for rating change
        card.querySelector('.rating-dropdown').addEventListener('change', function() {
          handleRatingChange(item.id, parseInt(this.value, 10));
        });

        // Event listener for save button
        card.querySelector('.save-movie-btn').addEventListener('click', function() {
          saveMovie(item.id);
        });
      });
    })
    .catch(error => {
      console.error('Fetch error:', error.message);
    });
});

function handleRatingChange(movieId, rating) {
  fetch('rate_actionmovie.php?movieId=' + movieId + '&rating=' + rating)
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(updatedData => {
      const cardToUpdate = document.querySelector('#card-' + movieId);
      if (cardToUpdate) {
        cardToUpdate.querySelector('.total-ratings').textContent = `(${updatedData.total_ratings} Ratings, ${updatedData.sum_ratings} Total Points)`;
      }
    })
    .catch(error => {
      console.error('Fetch error:', error.message);
    });
}

function saveMovie(movieId) {
  fetch('save_movie.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: 'movieId=' + movieId
  })
  .then(response => {
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    return response.json();
  })
  .then(data => {
    if (data.success) {
      console.log('Movie saved successfully');
    } else {
      console.error('Error saving movie:', data.error);
    }
  })
  .catch(error => {
    console.error('Fetch error:', error.message);
  });
}

// Function to fetch saved movies for the user
// Function to fetch saved movies for the user
function fetchSavedMovies() {
  fetch('fetch_saved_movies.php')
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(savedMovieIds => {
      const libraryContainer = document.querySelector('.library-container');
      
      if (!Array.isArray(savedMovieIds)) {
        console.error('Expected an array of movie IDs, got:', savedMovieIds);
        return; // Exit the function if the data is not an array
      }

      // Clear existing content in the library container
      libraryContainer.innerHTML = '';

      // Iterate over each saved movie ID and fetch its details
      savedMovieIds.forEach(movieId => {
        fetch(`get_movie_details.php?movieId=${movieId}`)
          .then(response => {
            if (!response.ok) {
              throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
          })
          .then(movieDetails => {
            // Create and insert the movie card HTML into the library container
            const movieCard = createMovieCard(movieDetails);
            libraryContainer.appendChild(movieCard);
          })
          .catch(error => {
            console.error('Fetch error:', error.message);
          });
      });
    })
    .catch(error => {
      console.error('Fetch error:', error.message);
    });
}


document.addEventListener('DOMContentLoaded', function() {
  fetchSavedMovies(); // Call this function on page load
});
