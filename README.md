# js8call-bin

AUR packaging for the official JS8Call Linux x86_64 AppImage released by the
JS8Call-improved development organization.

Beginning with upstream version 2.5.0, the program name is again **JS8Call**,
although official development remains hosted by **JS8Call-improved**.  Upstream
distributes Linux end-user releases as AppImages, so this package deliberately
installs the official AppImage unchanged rather than rebuilding from source.

## Maintainer workflow

Required for updating the AUR repository:

- `pacman-contrib` (`updpkgsums`)
- `jq`
- `curl`
- `git`

Run:

```sh
./update.sh
makepkg -si
```

Then test the desktop entry, audio device selection and a normal program start
before committing and pushing `PKGBUILD` and `.SRCINFO`.

The updater reads GitHub's latest stable release through its JSON API, verifies
that the x86_64 AppImage asset exists, changes `pkgver`/`pkgrel` as needed,
updates checksums and regenerates `.SRCINFO`.
