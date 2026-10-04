# mango-layout-tray-bin

AUR packaging for the prebuilt Mango Layout Tray release. It downloads the Linux
x86_64 archive from GitHub and installs the app, its bundled layer-shell library,
desktop entry, icon, documentation, and licenses. Rust is not needed.

The upstream GitHub repository is currently private. Make it public before
publishing this package to AUR so its release archive can be downloaded without
GitHub credentials. The package has been built locally using the same verified
release archive, downloaded with the maintainer's authenticated GitHub session.

Build and install locally:

```sh
makepkg -si
```

The `origin` remote points to the intended AUR repository. Once your AUR account
and SSH key are ready, publish the prepared commit:

```sh
git push -u origin master
```

This repository has not been pushed to AUR. `mango-layout-tray-bin` provides and
conflicts with the source package `mango-layout-tray`.

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
