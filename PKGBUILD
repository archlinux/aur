# Maintainer: Blaadick <null>

_repoowner="vinceliuice"
_reponame="MacTahoe-gtk-theme"
pkgname="mactahoe-gtk-theme"
pkgdesc="MacOS Tahoe theme for gtk desktops"
license=("MIT")
pkgver="2026.07.07"
pkgrel=2
arch=("any")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_repoowner/$_reponame/archive/refs/tags/${pkgver//./-}.tar.gz")
sha512sums=("3a09ba418e7a8782f0337ca5748d21fa951541bbd4889944b96a378e406c34c77b251814837bdb030928963cc70ae6183a375859e23e2e9ab1d49a3504f6fa2b")
url="https://github.com/$_repoowner/$_reponame"
options=("!debug")

package() {
    cd "$_reponame-${pkgver//./-}"

    _destination="$pkgdir/usr/share/themes/"
    mkdir -p "$_destination"
    ./install.sh -HD -o solid -d "$_destination"
}
