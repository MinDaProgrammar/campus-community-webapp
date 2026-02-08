<%-- buildathon/src/main/webapp/views/post.jsp --%>
<form id="community-new-post" class="community-form" 
      action="${pageContext.request.contextPath}/community" 
      method="post" 
      enctype="multipart/form-data">

    <header class="post-header">
        <span class="post-user">Create new post</span>
    </header>

    <input type="text" id="title" name="title" placeholder="Title" required>

    <label for="image" class="image-upload" id="imageUpload">
        <span class="placeholder-text" id="placeholderText">Select an image</span>
        <img id="imagePreview" src="" alt="" class="image-preview">
        
        <input type="file" id="image" name="image" accept="image/*">
    </label>

    <textarea id="description" name="content" placeholder="Description"></textarea>

    <button type="submit" class="submit-btn">
        Post
    </button>

    <script src="${pageContext.request.contextPath}/js/upload-preview.js"></script>
</form>