# granola-wine

Arch/AUR packaging for the Windows build of [Granola](https://www.granola.ai/),
running under Wine.

This package extracts the upstream Windows NSIS/Electron installer payload and
installs the application files under `/opt/granola-wine/app`. At runtime, the
launcher copies those files into the user's dedicated Wine prefix, because the
Granola app expects to live at the normal Windows per-user install path:

```text
C:\users\<user>\AppData\Local\Programs\@granolaelectron\Granola.exe
```

## Install

From AUR:

```bash
yay -S granola-wine
```

Manual build:

```bash
git clone https://aur.archlinux.org/granola-wine.git
cd granola-wine
makepkg -si
```

## First Run

Launch Granola once to create the Wine prefix and copy the app payload:

```bash
granola
```

Runtime state is kept in user-writable locations:

```text
~/.wine-prefixes/granola
~/.local/share/granola-wine/granola.log
```

The system package files remain under:

```text
/opt/granola-wine/app
```

## Browser Sign-In

Granola uses the `granola://` URL scheme for browser sign-in callbacks. The
package installs a desktop entry with:

```ini
Exec=granola %u
MimeType=x-scheme-handler/granola;
```

If your browser does not offer to open Granola after sign-in, register the
handler manually as your normal user:

```bash
xdg-mime default granola-wine.desktop x-scheme-handler/granola
xdg-settings set default-url-scheme-handler granola granola-wine.desktop
```

The launcher redirects stdin/stdout/stderr to the runtime log. This is
intentional: desktop/browser launches can otherwise give Electron a bad
`stderr` descriptor and trigger an `open EBADF` error in the main process.

## Window Decorations

The launcher configures the Granola Wine prefix with:

```bash
wine reg add 'HKCU\Software\Wine\X11 Driver' /v Decorated /t REG_SZ /d N /f
wine reg add 'HKCU\Software\Wine\X11 Driver' /v Managed /t REG_SZ /d Y /f
```

This disables Wine's native X11 decorations while keeping Granola's own Electron
custom titlebar and border. Do not patch out Granola's Electron
`titleBarOverlay` from `resources/app.asar`; doing that removes the custom app
frame and leaves the Wine window without a useful border.

If window decorations look wrong after changing Wine settings, restart the
prefix:

```bash
WINEPREFIX="$HOME/.wine-prefixes/granola" wineserver -k
granola
```

## Troubleshooting

Check the URL handler:

```bash
xdg-mime query default x-scheme-handler/granola
```

Expected output:

```text
granola-wine.desktop
```

Check the Wine decoration settings:

```bash
WINEPREFIX="$HOME/.wine-prefixes/granola" wine reg query 'HKCU\Software\Wine\X11 Driver'
```

Expected values:

```text
Decorated    REG_SZ    N
Managed      REG_SZ    Y
```

Check logs:

```bash
tail -n 200 ~/.local/share/granola-wine/granola.log
```

If the app payload gets out of sync after a package upgrade, remove the copied
per-user app directory and launch again:

```bash
rm -rf "$HOME/.wine-prefixes/granola/drive_c/users/$(id -un)/AppData/Local/Programs/@granolaelectron"
granola
```

## Notes for Maintainers

Only commit source packaging files to AUR: `PKGBUILD`, `.SRCINFO`, launcher,
desktop entry, install script, license note, and documentation. Do not commit
the downloaded Windows installer, built package archive, `src/`, or `pkg/`.

Regenerate `.SRCINFO` after any `PKGBUILD` change:

```bash
makepkg --printsrcinfo > .SRCINFO
```
