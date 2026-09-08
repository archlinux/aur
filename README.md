# moeka-bin

Arch Linux packaging for [Moeka](https://moeka.app), a local-first Markdown
editor. Uses the upstream [v0.1.13 release](https://github.com/MoekaProject/community/releases/tag/v0.1.13)
for x86_64 and aarch64, with SHA-256 verification.

Build and install with the standard Arch build tools (`base-devel`):

```sh
makepkg -si
```

Launch `moeka` from the terminal or Moeka from the application menu. Use
`moeka-x11` or the menu's **Open with X11 system decorations** action to force
X11. Arch's system libraries replace the bundled libraries.

Required dependencies cover the directly linked runtime libraries, fontconfig
configuration for font discovery, and Vulkan rendering. Choose a provider of
`vulkan-driver` appropriate for your GPU if prompted during installation.
The X11 libraries are linked directly and are required even on Wayland.

`wayland` is optional for native Wayland support. A graphics driver may also
depend on it independently of Moeka. For file dialogs, install
`xdg-desktop-portal` and a backend appropriate for your desktop. Clipboard tools,
browser integration, and CJK fonts are optional dependencies.

To update the package, change `pkgver`, reset `pkgrel` to `1`, download and
inspect both release archives, and update their checksums. The downloaded
filenames include the version so makepkg caches do not reuse older releases.
Regenerate AUR metadata after changing `PKGBUILD`:

```sh
makepkg --verifysource
makepkg --printsrcinfo > .SRCINFO
makepkg
```

Commit only `PKGBUILD`, `.SRCINFO`, `moeka-x11`, `.gitignore`, and this README
to the AUR repository; build outputs and downloaded archives are ignored.
