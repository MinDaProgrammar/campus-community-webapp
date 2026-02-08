document.addEventListener("DOMContentLoaded", function () {
    const fileInput = document.getElementById("image");
    const preview = document.getElementById("imagePreview");
    const placeholder = document.getElementById("placeholderText");

    if (!fileInput) return; // safety check

    fileInput.addEventListener("change", function () {
        const file = fileInput.files[0];
        if (!file) return;

        // Optional: validate image type
        if (!file.type.startsWith("image/")) {
            alert("Please select an image file");
            fileInput.value = "";
            return;
        }

        const reader = new FileReader();
        reader.onload = function (e) {
            preview.src = e.target.result;
            preview.style.display = "block";
            placeholder.style.display = "none";
        };
        reader.readAsDataURL(file);
    });
});
