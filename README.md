# qt-solarized

Application-independent Solarized Light and Solarized Dark stylesheets for Qt5
and Qt6 applications.

## Installation

```sh
paru -S qt-solarized
```

Normal `makepkg` builds execute the launcher unit tests through the PKGBUILD
`check()` function.

## Usage

```sh
qt-solarized avidemux3_qt5 video.mp4
qt-solarized --dark masterpdfeditor4 document.pdf
QT_SOLARIZED_THEME=light qt-solarized designer
```

Automatic mode checks Darkman first, then GNOME's `color-scheme` setting, and
defaults to Solarized Light. Applications must be restarted after the system
color scheme changes.

The launcher also defaults `QT_QPA_PLATFORMTHEME` to `gtk3` so cooperative Qt
applications inherit desktop fonts, icons, dialogs, and other platform
settings. The QSS palette handles applications that otherwise force Fusion or
their own light/dark palette.

## Desktop Entries

Use the launcher as the executable in a desktop entry or a small wrapper:

```ini
Exec=qt-solarized avidemux3_qt5 %f
```

## Limitations

- Qt stylesheets cannot alter custom-painted application content.
- Existing application windows do not recolor live; restart them after a mode
  change.
- Applications with nonstandard argument parsing may require a wrapper.
