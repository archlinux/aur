document.addEventListener("DOMContentLoaded", function() {
    let customCustomCSS = `
    :root {
      /* Modify these to change your theme colors: */
      --primary: #61AFEF;
      --text: #ABB2BF;
      --background: #282C34;
      --background-elevated: #3B4048;
}
`;

    let s = document.createElement('style');
    s.type = 'text/css';
    s.innerHTML = `
HERE
` + customCustomCSS;
    document.head.appendChild(s);
});
