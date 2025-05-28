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
    if (window.Prism) {
      Prism.highlightElement(codeBlock);
    }
  })
  .catch(error => {
    console.error('Error loading Lua script:', error);
  });
