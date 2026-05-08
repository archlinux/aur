# openstudioapplication AUR package

This is a source package for OpenStudioApplication 1.11.0 on Arch Linux.

It depends on the existing `openstudio-bin=3.11.0` SDK package and installs
the private application bundle under `/usr/lib/openstudioapplication`, with launchers
at `/usr/bin/OpenStudioApp` and `/usr/bin/openstudioapplication`.

The current package still follows upstream's Conan-based dependency flow. That
means `makepkg` fetches Conan binary packages during `build()`. The cleaner
long-term path is either an upstream binary release suitable for an
`openstudioapplication-bin` package, or replacing the pinned Conan dependency
set with Arch-packaged libraries.

Build locally with:

```sh
makepkg -Csf
```

After changing `PKGBUILD`, regenerate metadata with:

```sh
makepkg --printsrcinfo > .SRCINFO
```
