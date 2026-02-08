<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buildathon</title>
    <link rel="stylesheet" href="/buildathon/css/style.css">
    <link rel="stylesheet" href="/buildathon/css/community.css">
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <main class="content" id="content">
        <div class="community">
            <aside class="sidebar">
                <h2>Groups</h2>
                <ul class="group-list">
                    <li><button class="community-group-btn" data-group="all">General</button></li>
                    <li><button class="community-group-btn" data-group="group1">DACS</button></li>
                    <li><button class="community-group-btn" data-group="group2">Outings</button></li>
                </ul>
            </aside>
        
            <div class="posts">
                <jsp:include page="post.jsp" />
        
                <c:forEach var="post" items="${postList}">
                    <article class="community-post">
                        <header class="post-header">
                            <span class="post-user">${post.username}</span>
                            <div class="post-date">
                                <span class="time">${post.time}</span>
                                <span class="date">${post.date}</span>
                            </div>
                        </header>
        
                        <h2 class="post-title">${post.title}</h2>
        
                        <c:if test="${not empty post.imageUrl}">
                            <img class="post-image" 
                                src="${pageContext.request.contextPath}/${post.imageUrl}" 
                                alt="Post image">
                        </c:if>
        
                        <div class="post-text">
                            ${post.content}
                        </div>
        
                        <%-- Inside the <c:forEach var="post" ...> loop in community.jsp --%>
                        <section class="comments-container">
                            <h3 class="comments-title">Comments</h3>
                            
                            <div class="comments-list">
                                <c:forEach var="comm" items="${post.comments}">
                                    <div class="comment-bubble">
                                        <span class="comment-author">${comm.username}</span>
                                        <p class="comment-text">${comm.commentText}</p>
                                    </div>
                                </c:forEach>
                            </div>
                            
                            <form action="${pageContext.request.contextPath}/addComment" method="post" class="comment-input-wrapper">
                                <input type="hidden" name="postId" value="${post.postId}">
                                <input type="hidden" name="boardType" value="community">
                                
                                <input type="text" name="commentText" class="comment-field" placeholder="Write a comment..." required>
                                <button type="submit" class="comment-send-btn">
                                    <i class="fas fa-paper-plane"></i> Send
                                </button>
                            </form>
                        </section>
                    </article>
                </c:forEach>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>