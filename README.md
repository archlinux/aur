# mango-layout-tray-bin

AUR packaging for the prebuilt Mango Layout Tray release. It downloads the Linux
x86_64 archive from GitHub and installs the app, its bundled layer-shell library,
desktop entry, icon, documentation, and licenses. Rust is not needed.

Install with an AUR helper:

```sh
yay -S mango-layout-tray-bin
```

Or build and install locally:

```sh
makepkg -si
```

The public GitHub release archive is checked against its pinned SHA256 checksum.
`mango-layout-tray-bin` provides and conflicts with the source package
`mango-layout-tray`. The `origin` remote points to its AUR repository; publish
updates with `git push origin master`.

For a new release, update `pkgver`, reset `pkgrel` to `1`, replace the archive's
SHA256 checksum, then regenerate the metadata and test the package:

```sh
makepkg --printsrcinfo > .SRCINFO
makepkg --cleanbuild
namcap PKGBUILD mango-layout-tray-bin-*.pkg.tar.zst
```

Only x86_64 is listed because that is the architecture currently published by
the upstream release workflow. Runtime requirements include GTK4 and glibc 2.39
or newer. Startup remains opt-in in the app's Settings.
