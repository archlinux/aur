# tar1090-git (AUR)

PKGBUILD for [tar1090](https://github.com/wiedehopf/tar1090), the web interface for readsb / dump1090-fa.
Upstream has no tags, so this tracks `master` and takes its version from upstream's `version` file.
The aircraft database is built in at package time from [tar1090-db](https://github.com/wiedehopf/tar1090-db).

    makepkg -si
    makepkg --printsrcinfo > .SRCINFO
