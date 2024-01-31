document.addEventListener("DOMContentLoaded", function() {
    const profileForm = document.querySelector(".profile-form");

    profileForm.addEventListener("submit", function(event) {
        event.preventDefault();
        
        // Client-side validation (if needed)
        // Example: Validate image size, file type, input fields, etc.

        const formData = new FormData(this);

        fetch('update_admin_profile.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => alert(data.message))
        .catch(error => console.error('Error:', error));
    });
});
