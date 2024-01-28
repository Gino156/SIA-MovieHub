document.addEventListener('DOMContentLoaded', function() {
    fetch('latest_data.php')
      .then(response => response.json())
      .then(data => {
        const container = document.querySelector('.container');

        data.forEach(item => {
          const card = document.createElement('div');
          card.className = 'card';
          card.innerHTML = `
            <img src="${item.pic}" alt="Image">
            <div class="title">${item.title}</div>
            <div class="info">
                <span class="info-label">Release Date:</span> ${item.release_date}<br>
                <span class="info-label">Director:</span> ${item.director}<br>
                <span class="info-label">Cast:</span> ${item.cast}<br>
                <div class="rating-section">
                    <span class="info-label">Rate:</span>
                    <select class="rating-dropdown">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <span class="total-ratings">(${item.number_of_total_ratings} Ratings)</span>
                </div>
            </div>
            <a href="${item.video_link}" target="_blank" class="btn-watch-trailer">Watch Trailer</a>
          `;
          container.appendChild(card);
        });
      })
      .catch(error => console.error('Error:', error));
});
