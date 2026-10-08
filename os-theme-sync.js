const darkQuery = matchMedia('(prefers-color-scheme: dark)');

function syncDesktopThemeColor() {
  vivaldi.prefs.set({
    path: 'vivaldi.system.desktop_theme_color',
    value: darkQuery.matches ? 'dark' : 'light',
  });
}

darkQuery.addEventListener('change', syncDesktopThemeColor);
syncDesktopThemeColor();
