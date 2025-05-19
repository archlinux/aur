# openbsd-keyring

This Arch Linux package installs the OpenBSD release (and firmware) signing
keys in /etc/signify.

## ToDo

We could also add the release keys of other OpenBSD projects, such as OpenSSH
and Libressl. Perhaps we could also download the individual keys directly
instead of the tarball, so that we can see via sha256sums if a key changes
afterwards.

## License

As the keys are basically random numbers, they are not licensable. The PKGBUILD
and other files in this repository are licensed under the 0BSD license.
