<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="buddy" items="${buddyList}">
    <article class="buddy_post">
        <header class="post-header">
            <span class="post-user">${buddy.username}</span>
            <span class="post-date">${buddy.createdAt}</span>
        </header>

        <h2 class="post-title">${buddy.title}</h2>
        
        <div style="font-size: 0.85em; color: #aaa; margin-bottom: 8px;">
            Subject: ${buddy.subject} | Language: ${buddy.preferredLanguage}
        </div>

        <div class="post-text">
            ${buddy.content}
        </div>

        <div class="post-actions" style="margin-top: 15px; display: flex; justify-content: flex-end;">
            <button type="button" class="button_search" style="padding: 8px 20px; width: auto; font-size: 0.9em;">
                Join Session
            </button>
        </div>
    </article>
</c:forEach>
