// Fetch and display Lua code with Prism highlight
fetch('script.lua')
  .then(response => {
    if (!response.ok) throw new Error('Failed to fetch script.lua');
    return response.text();
  })
  .then(data => {
    const codeBlock = document.getElementById('codeblock');
    codeBlock.textContent = data;
    Prism.highlightElement(codeBlock);
  })
  .catch(err => {
    console.error(err);
    document.getElementById('codeblock').textContent = 'Failed to load script.lua';
  });

// Scroll reveal animations
document.addEventListener('DOMContentLoaded', () => {
  const targets = document.querySelectorAll('.image-section, .code-section');

  function reveal() {
    const windowBottom = window.innerHeight + window.scrollY;
    targets.forEach(el => {
      if (el.offsetTop < windowBottom - 100) {
        el.classList.add('visible');
      }
    });
  }

  window.addEventListener('scroll', reveal);
  reveal(); // initial check


  // Carousel logic
  const images = [
    'gui.png',
    'gui1.png',
    'gui2.png',
    'gui3.png',
    'gui4.png',
    'gui5.png',
  ];

  let currentIndex = 0;
  const imgElement = document.getElementById('carousel-image');
  const leftBtn = document.querySelector('#gui-carousel-section .carousel-arrow.left');
  const rightBtn = document.querySelector('#gui-carousel-section .carousel-arrow.right');

  function showImage(index) {
    if (index < 0) index = images.length - 1;
    else if (index >= images.length) index = 0;
    currentIndex = index;
    imgElement.src = images[currentIndex];
  }

  leftBtn.addEventListener('click', () => {
    showImage(currentIndex - 1);
  });

  rightBtn.addEventListener('click', () => {
    showImage(currentIndex + 1);
  });

  // Keyboard navigation
  document.addEventListener('keydown', e => {
    if (e.key === 'ArrowLeft') showImage(currentIndex - 1);
    if (e.key === 'ArrowRight') showImage(currentIndex + 1);
  });

  // Initialize carousel to first image
  showImage(0);
});
