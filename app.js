document.addEventListener('DOMContentLoaded', () => {
    const playButtons = document.querySelectorAll('.play-btn');

    playButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            const trackDiv = e.target.closest('.track');
            const trackTitle = trackDiv.dataset.title;
            
            // Simulación de reproducción
            alert(`¡Reproduciendo ahora: ${trackTitle}! 🎵`);
            
            // Cambiar texto del botón temporalmente
            const originalText = button.textContent;
            button.textContent = 'Sonando...';
            button.style.backgroundColor = '#1ed760';
            
            setTimeout(() => {
                button.textContent = originalText;
                button.style.backgroundColor = '';
            }, 3000);
        });
    });
});
