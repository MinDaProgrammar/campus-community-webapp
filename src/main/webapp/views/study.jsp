<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Buddy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/buildathon/css/style.css">
    <link rel="stylesheet" href="/buildathon/css/study_existPost.css">

</head>
<body>
    <jsp:include page="navbar.jsp" />
    <main class="content" id="content">
      <details>
        <summary>Filter</summary>
        <p>> Date: Newest First</p>
      </details> 
      <jsp:include page="search.jsp"/>
      <!-- <button class="filter-btn" type="button" aria-label="Filter"> <i class="fa fa-filter"></i>
      </button> --> 
      <div class="study-posts">
      <div class="post-box">
        <jsp:include page="study_post.jsp"/>
      </div>
        <jsp:include page="study_exist_post.jsp"/>
      </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>