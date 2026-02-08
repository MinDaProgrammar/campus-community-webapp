<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buildathon</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <jsp:include page="/views/navbar.jsp" />

<main class="content">
    <!-- Filter Sidebar -->
    <aside class="filter-sidebar">
        <div class="filter-header">
            <h3>Filter Posts</h3>
        </div>
        
        <div class="filter-section">
            <button class="filter-dropdown-btn">
                Categories
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </button>
            <div class="filter-options">
                <label class="filter-option">
                    <input type="checkbox" value="events">
                    <span>Events</span>
                </label>
                <label class="filter-option">
                    <input type="checkbox" value="workshops">
                    <span>Workshops</span>
                </label>
                <label class="filter-option">
                    <input type="checkbox" value="announcements">
                    <span>Announcements</span>
                </label>
                <label class="filter-option">
                    <input type="checkbox" value="resources">
                    <span>Resources</span>
                </label>
            </div>
        </div>

        <div class="filter-section">
            <button class="filter-dropdown-btn">
                Date Range
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </button>
            <div class="filter-options">
                <label class="filter-option">
                    <input type="radio" name="date" value="today">
                    <span>Today</span>
                </label>
                <label class="filter-option">
                    <input type="radio" name="date" value="week">
                    <span>This Week</span>
                </label>
                <label class="filter-option">
                    <input type="radio" name="date" value="month">
                    <span>This Month</span>
                </label>
                <label class="filter-option">
                    <input type="radio" name="date" value="all" checked>
                    <span>All Time</span>
                </label>
            </div>
        </div>

        <div class="filter-section">
            <button class="filter-dropdown-btn">
                Sort By
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="6 9 12 15 18 9"></polyline>
                </svg>
            </button>
            <div class="filter-options">
                <label class="filter-option">
                    <input type="radio" name="sort" value="newest" checked>
                    <span>Newest First</span>
                </label>
                <label class="filter-option">
                    <input type="radio" name="sort" value="oldest">
                    <span>Oldest First</span>
                </label>
                <label class="filter-option">
                    <input type="radio" name="sort" value="popular">
                    <span>Most Popular</span>
                </label>
            </div>
        </div>
    </aside>

    <!-- MOVE ALL CARDS HERE - INSIDE THIS DIV -->
    <div class="announcements-container">
        <!-- Announcement Card 1 -->
        <div class="announcement-card">
            <div class="announcement-header">
                <div class="announcement-user">
                    <img src="./images/inc.png" alt="Profile" class="user-avatar">
                    <span class="username">MSV Incognito</span>
                </div>
                <div class="announcement-timestamp">
                    <span class="time">2:30 PM</span>
                    <span class="date">Feb 7, 2026</span>
                </div>
            </div>
            <div class="announcement-image">
                <img src="./images/48HBuildathon.jpeg" alt="Buildathon Welcome" class="zoomable">
            </div>
            <div class="announcement-body">
                <h3>LAST MINUTE SPOTS 🚨</h3>
                <p>The Buildathon starts today, and we've opened 6 extra last-minute spots!
                    If you didn't get a chance to secure your ticket earlier, this is your moment.        
                    When and Where?
                    📌PHS1 - 18:00
                    💡Last chance to sign up:
                    https://buildathon.msvincognito.nl
                </p>
            </div>
        </div>

        <!-- Announcement Card 2 -->
        <div class="announcement-card">
            <div class="announcement-header">
                <div class="announcement-user">
                    <img src="./images/inc.png" alt="Profile" class="user-avatar">
                    <span class="username">MSV Incognito</span>
                </div>
                <div class="announcement-timestamp">
                    <span class="time">10:15 AM</span>
                    <span class="date">Feb 6, 2026</span>
                </div>
            </div>
            <div class="announcement-image">
                <img src="./images/hood.jpeg" alt="Team Assignments" class="zoomable">
            </div>
            <div class="announcement-body">
                <h3>Final call! Today is your last chance to order the DACS hoodie for 2026.</h3>
                <p>🛒 Get yours here: https://store.msvincognito.nl/product/dacs-hoodie-2026-edition
                    💰 Price: €25.99
                    ⏰ Orders close tonight - 19 December at 23:59
                    Hoodies will arrive in January, with more details coming in the new year 💙
                </p>
            </div>
        </div>

        <!-- Announcement Card 3 -->
        <div class="announcement-card">
            <div class="announcement-header">
                <div class="announcement-user">
                    <img src="./images/inc.png" alt="Profile" class="user-avatar">
                    <span class="username">MSV Incognito</span>
                </div>
                <div class="announcement-timestamp">
                    <span class="time">4:45 PM</span>
                    <span class="date">Feb 5, 2026</span>
                </div>
            </div>
            <div class="announcement-image">
                <img src="./images/chirs.jpeg" alt="Workshop" class="zoomable">
            </div>
            <div class="announcement-body">
                <h3>Merry early christmas fellow duckies 🎅</h3>
                <p>Our christmas tree is getting delivered tomorrow and we need your help to come decorate it! 🎄 Visit us in our common room when we announce our tree has arrived, and enjoy some hot chocolate and christmas snacks while we decorate our tree ❄</p>
            </div>
        </div>

        <!-- Announcement Card 4 -->
        <div class="announcement-card">
            <div class="announcement-header">
                <div class="announcement-user">
                    <img src="./images/inc.png" alt="Profile" class="user-avatar">
                    <span class="username">MSV Incognito</span>
                </div>
                <div class="announcement-timestamp">
                    <span class="time">1:00 PM</span>
                    <span class="date">Feb 4, 2026</span>
                </div>
            </div>
            <div class="announcement-image">
                <img src="./images/car.jpeg" alt="Prizes" class="zoomable">
            </div>
            <div class="announcement-body">
                <h3>🌿 Save the Date – FSE Career Day 2026 🌿</h3>
                <p>On 16 April 2026, the FSE Career Day is bringing together companies, institutes, and organisations for a full day of networking, inspiration, and career opportunities.
                    📍 Learning Spaces, PHS1
                    ⏰ 10:00–16:00
                    More info coming soon, but for now - mark your calendar! ✨
                </p>
            </div>
        </div>

        <!-- Announcement Card 5 -->
        <div class="announcement-card">
            <div class="announcement-header">
                <div class="announcement-user">
                    <img src="./images/inc.png" alt="Profile" class="user-avatar">
                    <span class="username">MSV Incognito</span>
                </div>
                <div class="announcement-timestamp">
                    <span class="time">9:30 AM</span>
                    <span class="date">Feb 3, 2026</span>
                </div>
            </div>
            <div class="announcement-image">
                <img src="./images/pan.jpeg" alt="Resources" class="zoomable">
            </div>
            <div class="announcement-body">
                <h3>Student panels coming up for period 2 exams📚</h3>
                <p>Hii everyone!🐥
                    For those who don't know what a student panel is: it's a session that serves as feedback for courses/projects that you just had. The student panels are important because they help us improve the courses, but also make our academic path more enjoyable. 
                    Note: Tessa, the student counsellor, will join most sessions to take notes and will anonymously pass them to professors
                    PS: if you're coming please go to your gc and "join" the event, thank you!🙏🏻
                </p>
            </div>
        </div>
    </div>
</main>

<script src="./js/navigation.js"></script>
<jsp:include page="/views/footer.jsp" />

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const modal = document.createElement("div");
        modal.className = "image-modal";
        modal.innerHTML = `<img alt="Full image view">`;
        document.body.appendChild(modal);

        const modalImg = modal.querySelector("img");

        document.querySelectorAll(".zoomable").forEach(img => {
            img.addEventListener("click", () => {
                modalImg.src = img.src;
                modal.classList.add("open");
            });
        });

        modal.addEventListener("click", () => modal.classList.remove("open"));
        document.addEventListener("keydown", (e) => {
            if (e.key === "Escape") modal.classList.remove("open");
        });
    });
</script>

<script>
    const header = document.querySelector(".main-header");
    window.addEventListener("scroll", () => {
        if (window.scrollY > 10) {
            header.classList.add("scrolled");
        } else {
            header.classList.remove("scrolled");
        }
    });
</script>

</body>
</html>