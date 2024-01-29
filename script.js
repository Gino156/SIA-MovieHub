document.addEventListener('DOMContentLoaded', function() {
  fetch('latest_data.php')
    .then(function(response) {
      return response.json();
    })
    .then(function(data) {
      const container = document.querySelector('.container');

      data.forEach(function(item) {
        const card = document.createElement('div');
        card.className = 'card';
        card.id = 'card-' + item.id;

        card.innerHTML = '<img src="' + item.pic + '" alt="Image">' +
          '<div class="title">' + item.title + '</div>' +
          '<div class="info">' +
          '<span class="info-label">Release Date:</span> ' + item.release_date + '<br>' +
          '<span class="info-label">Director:</span> ' + item.director + '<br>' +
          '<span class="info-label">Cast:</span> ' + item.cast + '<br>' +
          '<div class="rating-section">' +
          '<span class="info-label">Rate:</span>' +
          '<select class="rating-dropdown" id="rating-' + item.id + '" name="rating-' + item.id + '">' +
          '<option value="1">1</option>' +
          '<option value="2">2</option>' +
          '<option value="3">3</option>' +
          '<option value="4">4</option>' +
          '<option value="5">5</option>' +
          '</select>' +
          '<span class="total-ratings">(' + item.total_ratings + ' Ratings, ' + item.sum_ratings + ' Total Points)</span>' +
          '</div>' +
          '<a href="' + item.video_link + '" target="_blank" class="btn-watch-trailer">Watch Trailer</a>';

        container.appendChild(card);

        card.querySelector('.rating-dropdown').addEventListener('change', function() {
          handleRatingChange(item.id, parseInt(this.value, 10));
        });
      });
    })
    .catch(function(error) {
      console.error('Error:', error);
    });
});

function handleRatingChange(movieId, rating) {
  fetch('rate_actionmovie.php?movieId=' + movieId + '&rating=' + rating)
    .then(function(response) {
      return response.json();
    })
    .then(function(updatedData) {
      const cardToUpdate = document.querySelector('#card-' + movieId);
      if (cardToUpdate) {
        cardToUpdate.querySelector('.total-ratings').textContent = '(' + updatedData.total_ratings + ' Ratings, ' + updatedData.sum_ratings + ' Total Points)';
      }
    })
    .catch(function(error) {
      console.error('Error:', error);
    });
}
