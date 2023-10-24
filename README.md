# [Nordlayer](https://nordlayer.com) VPN package for [Artix Linux](https://artixlinux.org/) using Runit
[![Nordlayer version](https://img.shields.io/badge/nordlayer-3.0.0-green)](https://nordlayer.com/download/linux/)

## Important
This package is specifically maintained for working on Artix Linux using Runit
as the init service (It might be easy enough to port to Void Linux, I haven't
bothered to do so).

If you run into any errors feel free to create an [issue](https://github.com/vihu/nordlayer-runit/issues/new).

### Building the package manually:

```sh
git clone https://github.com/vihu/nordlayer-runit
cd nordlayer-runit
makepkg -si
```

### TODO

- [ ] Publish on AUR
