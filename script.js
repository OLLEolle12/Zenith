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
});
