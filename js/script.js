document.addEventListener("DOMContentLoaded", function () {
    // Fetch and include the header and footer
    fetch("headerfoot.html")
        .then(response => response.text())
        .then(data => {
            document.body.innerHTML = data + document.body.innerHTML;
        });
});