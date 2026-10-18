# Gemini desktop for Arch Linux

This package runs Google Gemini on x86_64.
It uses the system `electron44` runtime and a Rust native module.

Build and install:

```sh
makepkg -si
```

Start `gemini-desktop` or select Gemini from the application menu.
Gemini requires internet access and a Google account.

- Show or hide the window with `Ctrl+Alt+G`.
- Close the window to hide Gemini in the tray. Use the tray menu to quit.
- Change the shortcut and automatic startup in Settings.
- Use your AUR helper for updates.

Wayland shortcuts require a desktop with the GlobalShortcuts portal.
Window information and text input on Wayland require AT-SPI support in the target application.
X11 text input replaces the clipboard contents.

Enable the experimental Speak to Window feature:

```sh
GEMINI_ENABLE_SPEAK_TO_WINDOW=true gemini-desktop
```

Also set `GEMINI_ENABLE_STW_DESKTOP_CONTEXT=true` to enable desktop context.

Gemini stores settings in `${XDG_CONFIG_HOME:-~/.config}/Gemini/`.
Add Electron arguments to `${XDG_CONFIG_HOME:-~/.config}/gemini-desktop-flags.conf`, one argument per line.
Lines that start with `#` are comments.

Google's application is proprietary. The Linux integration uses the MIT license.
