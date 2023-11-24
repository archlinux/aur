# Rooster for Arch Linux

Arch Linux package for Rooster. You can install from source or via the AUR: https://aur.archlinux.org/packages/rooster.

Rooster's Arch Linux package is made available free of charge. You can support its development through [Liberapay](https://liberapay.com/conradkleinespel/) 💪

## Instructions

First, update the information in `PKGBUILD`.

Then, run the following commands:

```sh
# Update the build information and install the package
makepkg --printsrcinfo > .SRCINFO
makepkg -i
```

Then, publish to the AUR:
```sh
git clone ssh://aur@aur.archlinux.org/rooster.git aur-version
cp README.md PKGBUILD .SRCINFO aur-version/
cd aur-version
git add -A && git commit -m 'update version' && git push origin master
cd ..
rm -rf aur-version
```

## License

The source code is released under the Apache 2.0 license.
