# Azure Storage Blobfuse AUR package

This is an AUR package for [Azure/azure-storage-fuse](https://github.com/Azure/azure-storage-fuse).

* **Package**: [azure-storage-fuse<sup>AUR</sup>](https://aur.archlinux.org/packages/azure-storage-fuse)

## Build

To build the package, ensure you have make dependencies (`makedepends`) installed first.

Build the package with:

```sh
make
```

## Release

1. Bump `pkgver` in `PKGBUILD`.
2. Run `make checksum` and paste content in place of `sha256sums` in `PKGBUILD`.
3. Run `make`.
4. Commit and push.
