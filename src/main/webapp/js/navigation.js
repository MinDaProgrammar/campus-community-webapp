function loadPage(page) {
    // Instead of views/community.jsp, we call the servlet URL: /community
    fetch(page) 
        .then(response => {
            if (!response.ok) throw new Error("Page not found");
            return response.text();
        })
        .then(html => {
            document.getElementById("content").innerHTML = html;
        })
        .catch(error => {
            document.getElementById("content").innerHTML = "<h2>Error</h2><p>Could not load page.</p>";
            console.error(error);
        });
}

// Get all navigation items
const navItems = document.querySelectorAll('.nav-item');

// Add click event to each nav item
navItems.forEach(item => {
    item.addEventListener('click', function(e) {
        // Remove active class from all items
        navItems.forEach(nav => nav.classList.remove('active'));
        
        // Add active class to clicked item
        this.classList.add('active');
    });
});

// Set first item as active on page load
if (navItems.length > 0) {
    navItems[0].classList.add('active');
}

// Filter sidebar dropdown functionality
document.addEventListener('DOMContentLoaded', () => {
    const filterBtns = document.querySelectorAll('.filter-dropdown-btn');
    
    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const section = btn.closest('.filter-section');
            section.classList.toggle('open');
        });
    });
    
    // Open all sections by default
    document.querySelectorAll('.filter-section').forEach(section => {
        section.classList.add('open');
    });
});