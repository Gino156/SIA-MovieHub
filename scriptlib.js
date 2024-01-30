document.addEventListener('DOMContentLoaded', function() {
    fetchSavedMovies(); // Only fetch saved movies on DOMContentLoaded
  });

function fetchLatestMovies() {
  const container = document.querySelector('.container');
  const loadingIndicator = document.getElementById('loading');

  loadingIndicator.style.display = 'block'; // Show loading indicator

  fetch('latest_data.php')
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      loadingIndicator.style.display = 'none'; // Hide loading indicator

      data.forEach(item => {
        const card = createMovieCard(item);
        container.appendChild(card);
      });
    })
    .catch(error => {
      console.error('Fetch error:', error.message);
    });
}

function fetchSavedMovies() {
  const libraryContainer = document.querySelector('.library-container');
  const libraryLoading = document.getElementById('library-loading');
  const libraryError = document.getElementById('library-error');

  libraryLoading.style.display = 'block'; // Show loading indicator

  fetch('fetch_saved_movies.php')
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(savedMovieIds => {
      libraryLoading.style.display = 'none'; // Hide loading indicator

      if (!Array.isArray(savedMovieIds)) {
        console.error('Expected an array of movie IDs, got:', typeof savedMovieIds, savedMovieIds);
        libraryError.style.display = 'block'; // Show error message
        return;
      }

      libraryContainer.innerHTML = ''; // Clear existing content

      savedMovieIds.forEach(movieId => {
        fetch(`get_movie_details.php?movieId=${movieId}`)
          .then(response => {
            if (!response.ok) {
              throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
          })
          .then(movieDetails => {
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
      libraryLoading.style.display = 'none'; // Hide loading indicator
      libraryError.style.display = 'block'; // Show error message
    });
}

function createMovieCard(movieDetails) {
  const card = document.createElement('div');
  card.className = 'card';
  card.id = 'card-' + movieDetails.id;

  card.innerHTML = `
    <img src="/sia/uploads/pic1/${movieDetails.pic}" alt="Image">
    <div class="title">${movieDetails.title}</div>
    <div class="info">
      <span class="info-label">Release Date:</span> ${movieDetails.release_date}<br>
      <span class="info-label">Director:</span> ${movieDetails.director}<br>
      <span class="info-label">Cast:</span> ${movieDetails.cast}<br>
      <div class="rating-section">
        <span class="info-label">Rate:</span>
        <select class="rating-dropdown" id="rating-${movieDetails.id}" name="rating-${movieDetails.id}">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
        <span class="total-ratings">(${movieDetails.total_ratings} Ratings, ${movieDetails.sum_ratings} Total Points)</span>
      </div>
      <a href="${movieDetails.video_link}" target="_blank" class="btn-watch-trailer">Watch Trailer</a>
      <button class="save-movie-btn" data-movie-id="${movieDetails.id}">+</button>
    </div>`;

  // Add event listeners for rating dropdown and save movie button
  card.querySelector('.rating-dropdown').addEventListener('change', function() {
    handleRatingChange(movieDetails.id, parseInt(this.value, 10));
  });

  card.querySelector('.save-movie-btn').addEventListener('click', function() {
    saveMovie(movieDetails.id);
  });

  return card;
}

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
