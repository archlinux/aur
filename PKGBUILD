# Maintainer: Blaadick <null>

_repoowner="vinceliuice"
_reponame="MacTahoe-gtk-theme"
pkgname="mactahoe-gtk-theme"
pkgdesc="MacOS Tahoe theme for gtk desktops"
license=("MIT")
pkgver="2026.02.20"
_realpkgver="2026-02-20"
pkgrel=1
arch=("any")
source=("$pkgname-$_realpkgver.tar.gz::https://github.com/$_repoowner/$_reponame/archive/refs/tags/$_realpkgver.tar.gz")
sha512sums=("bec451dd1a7b2d49766b375a25b49b581e02b06ec7911cba8085787f47b0a32f53a2f72695e89ce6b0487544a8693fb2a05b4058a6f0889a4ab21ef4f8b16c8c")
url="https://github.com/$_repoowner/$_reponame"
options=("!debug")

package() {
    cd "$_reponame-$_realpkgver" || exit

    _destination="$pkgdir/usr/share/themes/"
    mkdir -p "$_destination"
    ./install.sh -d "$_destination"
}
