const buttons = document.querySelectorAll('.group-btn');

buttons.forEach(btn => {
    btn.addEventListener('click', () => {
        const group = btn.dataset.group;
        buttons.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
    });
});