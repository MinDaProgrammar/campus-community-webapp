<header class="main-header">
    <div class="header-container">
        <!-- Logo Section -->
        <div class="logo">
            <a href="#">
                <img src="./images/logo2.png" alt="Buildathon Logo" class="logo-image">
            </a>
        </div>
        
        <!-- Navigation Icons -->
        <nav class="nav-icons">
            <a href="/buildathon" class="nav-item" title="Home">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                </svg>
                <span>Home</span>
            </a>
            
            <a href="/buildathon/study" class="nav-item" title="Study">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                    <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                </svg>
                <span>Study Buddy!</span>
            </a>
            
            <a href="/buildathon/community" class="nav-item" title="Community">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                    <circle cx="9" cy="7" r="4"></circle>
                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                </svg>
                <span>Community</span>
            </a>
            
            <a href="#" class="nav-item" title="MarketPlace">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg>
                <span>Marketplace</span>
            </a>
        </nav>
        
        <!-- User Profile -->
        <div class="user-profile">
            <a href="#" class="profile-icon">
                <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </a>
        </div>
    </div>
</header>

<script>
// Immediately set active based on current page
document.addEventListener('DOMContentLoaded', () => {
    const navItems = document.querySelectorAll('.nav-item');
    const currentPath = window.location.pathname;
    
    navItems.forEach(item => {
        const href = item.getAttribute('href');
        
        // Remove active from all first
        item.classList.remove('active');
        
        // Check if this nav item matches current page
        if (currentPath.includes('/study') && href.includes('/study')) {
            item.classList.add('active');
        } else if (currentPath.includes('/community') && href.includes('/community')) {
            item.classList.add('active');
        } else if (currentPath.includes('/marketplace') && href.includes('/marketplace')) {
            item.classList.add('active');
        } else if ((currentPath === '/buildathon' || currentPath === '/buildathon/') && href === '/buildathon') {
            item.classList.add('active');
        }
    });
});
</script>
