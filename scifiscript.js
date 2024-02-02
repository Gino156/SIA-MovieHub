document.addEventListener('DOMContentLoaded', function() {
    // Fetch movie data from the server
    fetch('latest_scifi_data.php')
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
              <button class="save-movie-btn" data-movie-id="${item.id}">+</button>
              <button class="btn-watch-trailer" data-video-link="${item.video_link}">Watch Trailer</button>
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
  
          // Event listener for watch trailer button
          card.querySelector('.btn-watch-trailer').addEventListener('click', function(event) {
            event.preventDefault();
            const videoLink = this.getAttribute('data-video-link');
            const videoId = getYouTubeVideoId(videoLink);
            playTrailer(videoId);
          });
        });
      })
      .catch(error => {
        console.error('Fetch error:', error.message);
      });
  });
  
  function handleRatingChange(movieId, rating) {
    fetch('rate_scifimovie.php?scifiId=' + movieId + '&rating=' + rating)
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
    fetch('save_scifi.php', {
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
  
  function fetchSavedMovies() {
    fetch('fetch_saved_scifis.php')
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
          fetch(`get_scifi_details.php?movieId=${movieId}`)
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
      });
  }
  
  // YouTube modal functionality
  function getYouTubeVideoId(url) {
    const urlObj = new URL(url);
    return urlObj.searchParams.get('v');
  }
  
  let youtubePlayer; // Global variable to hold the YouTube player instance
  
  function playTrailer(videoId) {
    const modal = document.getElementById('youtubeModal');
    modal.style.display = 'block';
  
    if (youtubePlayer) {
      youtubePlayer.loadVideoById(videoId);
    } else {
      youtubePlayer = new YT.Player('youtubePlayer', {
        height: '390',
        width: '640',
        videoId: videoId,
        events: {
          'onReady': function(event) {
            event.target.playVideo();
          }
        }
      });
    }
  }
  
  function createMovieCard(movieDetails) {
    const card = document.createElement('div');
    card.className = 'movie-card';
    // Populate the card with movie details
    card.innerHTML = `
      <img src="${movieDetails.pic}" alt="${movieDetails.title}">
      <h3>${movieDetails.title}</h3>
      <!-- Other movie details here -->
    `;
    return card;
  }
  
  // Close modal functionality
  document.querySelector('.close-modal').addEventListener('click', function() {
    document.getElementById('youtubeModal').style.display = 'none';
    if (youtubePlayer) {
      youtubePlayer.stopVideo();
    }
  });
  
  window.onclick = function(event) {
    const modal = document.getElementById('youtubeModal');
    if (event.target == modal) {
      modal.style.display = 'none';
      if (youtubePlayer) {
        youtubePlayer.stopVideo();
      }
    }
  };
  