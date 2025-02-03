// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Disable DoH by default
pref("network.trr.mode", 5); 

// Whether to use gtk portal for the file picker.
//  - 0: never
//  - 1: always
//  - 2: auto (true for flatpak or GTK_USE_PORTAL=1, false otherwise)\
pref("widget.use-xdg-desktop-portal.file-picker", 1)

// Whether to use gtk portal for the mime handler.
//  - 0: never
//  - 1: always
//  - 2: auto (for now only true for flatpak, see bug 1516290)
pref("widget.use-xdg-desktop-portal.mime-handler", 1)
