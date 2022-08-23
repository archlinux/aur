# PICO-8 pkgbuild

This is an Arch Linux makepkg build file for the PICO-8 fantasy console.

You have to buy the software. This is just an install helper with a desktop file, MIME type, and config script.

Use it like so:

```bash
git clone https://github.com/joelsgp/pkgbuild-pico8
cd pkgbuild-pico8
# Download PICO-8 from whereever you bought it
mv ~/Downloads/pico-8_0.2.4c_amd64.zip .
makepkg -si
```

Only supports x86_64.

Footnote: there's an existing pkgbuild on the aur but it uses humble bundle.

 See here:
 - <https://gist.github.com/Addisonbean/538b4fa815b3a02dc6653538f026ee78>
 - <https://aur.archlinux.org/packages/pico-8>
