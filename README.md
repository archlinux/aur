# typeless-bin AUR package

Build and install with:

```sh
makepkg -si
```

The PKGBUILD downloads only upstream release artifacts, extracts the Windows
Electron application, applies the Linux platform patch, compiles one Rust
library implementing every native helper ABI, and bundles the matching
Electron 33 runtime.

The package is unofficial. X11 is the most complete desktop-session target.
On native Wayland, Typeless prefers `ydotool` for text and key injection. Enable
its daemon with:

```sh
systemctl --user enable --now ydotool.service
```

The user must be able to open `/dev/uinput` and the keyboard
`/dev/input/event*` devices. On Arch this normally means adding the user to the
`input` group and logging out and back in. `wtype` remains an optional fallback;
keyboard monitoring falls back to XRecord on X11/XWayland.

Selected-text capture uses AT-SPI on Linux. It never simulates `Ctrl+C` or
touches the clipboard, so foreground terminals and their command lines are not
interrupted. Applications that do not expose their text through accessibility
APIs safely return no selection.

Text insertion and backward deletion also prefer AT-SPI, which edits the
focused accessible text control at its caret position. `ydotool` remains the
fallback for terminals and applications that do not expose EditableText.
