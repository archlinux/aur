# granola-wine AUR package

This packages the Windows build of Granola AI Notepad for use under Wine on Arch Linux.

It preserves the working Linux/Wine behavior discovered locally:

- Extracts the NSIS installer payload instead of running the installer.
- Runs Granola from `C:\users\<user>\AppData\Local\Programs\@granolaelectron\Granola.exe` inside a dedicated prefix.
- Registers a desktop entry that can handle `granola://` auth callbacks.
- Redirects Wine stdio to avoid Electron `open EBADF` crashes from browser-launched callbacks.
- Disables Wine native decorations while keeping Granola's own Electron titlebar overlay.

Build locally:

```bash
makepkg -sf
```

Install locally:

```bash
makepkg -si
```

After installing, run this as your user so browser auth callbacks open Granola:

```bash
xdg-mime default granola-wine.desktop x-scheme-handler/granola
xdg-settings set default-url-scheme-handler granola granola-wine.desktop
```

The package intentionally does not patch `resources/app.asar`. Removing Granola's Electron `titleBarOverlay` breaks the custom app frame under Wine.
