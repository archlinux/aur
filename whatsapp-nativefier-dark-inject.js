(function () {
  function darkStartup() {
    var css = [
      ":root {",
      "    --dark: #1f232a;",
      "    --darker: #333943;",
      "    --light: #e9e9e9;",
      "    --accent: #7289da;",
      "  }",
      '  body [id *= "startup"] {',
      "    background-color: var(--dark) !important;",
      "  }",
      '  body [id *= "startup"] progress {',
      "    color: var(--accent) !important;",
      "    background-color: var(--darker) !important;",
      "  }",
      '  body [id *= "startup"] ::-moz-progress-bar {',
      "    background-color: var(--accent) !important;",
      "  }",
      '  body [id *= "startup"] circle {',
      "    stroke: var(--light);",
      "  }",
    ].join("\n");

    var node = document.createElement("style");
    node.type = "text/css";
    node.appendChild(document.createTextNode(css));
    var heads = document.getElementsByTagName("head");
    if (heads.length > 0) {
      heads[0].appendChild(node);
    } else {
      // no head yet, stick it whereever
      document.documentElement.appendChild(node);
    }
  }

  function darkTheme() {
    document.body.onload = function () {
      document.body.className = "dark web";
    };
  }

  function serviceWorkerHack() {
    if (
      document.querySelector(
        "a[href='https://support.google.com/chrome/answer/95414']"
      )
    ) {
      navigator.serviceWorker.getRegistration().then((registration) => {
        registration.unregister();
        document.location.reload();
      });
    }
  }

  // Make sure the initial load screen is dark
  darkStartup();
  // Apply official dark theme
  darkTheme();
  // Apply hack for service worker
  serviceWorkerHack();
})();
