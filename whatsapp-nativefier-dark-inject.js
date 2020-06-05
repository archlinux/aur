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
    const regexes = [
      // en (enlish)
      /whatsapp works with.*to use whatsapp.*update/i,
      // pt (portuguese)
      /o whatsapp funciona com.*para utilizar o whatsapp.*atualize/i,
      // ge (german)
      /whatsapp funktioniert mit.*um whatsapp zu benutzen.*aktualisiere/i,
      // es (spanish)
      /whatsapp funciona con.*para usar whatsapp.*actualiza/i,
      // ca (catalan)
      /whatsapp funciona amb.*per utilitzar whatsapp.*actualitza/i,
    ];

    for (const regex of regexes) {
      if (document.body.innerText.replace(/\n/g, " ").search(regex) !== -1) {
        navigator.serviceWorker.getRegistration().then(function (r) {
          r.unregister();
          document.location.reload();
        });
        return;
      }
    }
  }

  // Make sure the initial load screen is dark
  darkStartup();
  // Apply official dark theme
  darkTheme();
  // Apply hack for service worker
  serviceWorkerHack();
})();
