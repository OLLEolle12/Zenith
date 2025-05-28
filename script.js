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


// Image Carousel Logic
const images = [
  'gui.png',
  'gui1.png',
  'gui2.png',
  'gui3.png',
  'gui4.png',
  'gui5.png'
];

let currentImageIndex = 0;
const carouselImage = document.getElementById('carousel-image');
const leftArrow = document.getElementById('left-arrow');
const rightArrow = document.getElementById('right-arrow');

leftArrow.addEventListener('click', () => {
  currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
  carouselImage.src = images[currentImageIndex];
});

rightArrow.addEventListener('click', () => {
  currentImageIndex = (currentImageIndex + 1) % images.length;
  carouselImage.src = images[currentImageIndex];
});

// Load Lua Script Content into Code Block
fetch('script.lua')
  .then(response => {
    if (!response.ok) {
      throw new Error('Could not load script.lua');
    }
    return response.text();
  })
  .then(code => {
    const codeBlock = document.getElementById('lua-code-block');
    codeBlock.textContent = code;
    // Trigger Prism highlight
    if (window.Prism) {
      Prism.highlightElement(codeBlock);
    }
  })
  .catch(error => {
    console.error('Error loading Lua script:', error);
  });

