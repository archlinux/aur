# ro-cei-cert

An Arch Linux package that installs the Romanian electronic identity card
root and subordinate CA certificates into the system trust store.

The archive URL is configured in `PKGBUILD` as `RO_CEI_CERT_ZIP_LINK`. The
package downloads the archive during `makepkg`, verifies its SHA-256 checksum,
and installs the two certificates as `.crt` files. `update-ca-trust` is run
after installation, upgrade, and removal.

Build and install locally with:

```sh
makepkg -si
```

When the upstream archive changes, verify the new certificates and update both
the package version and `sha256sums` before publishing an updated package.
