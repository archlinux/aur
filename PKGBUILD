# Maintainer: Blaadick <null>

_repoowner="vinceliuice"
_reponame="MacTahoe-gtk-theme"

pkgname="mactahoe-gtk-theme"
pkgdesc="MacOS Tahoe theme for gtk desktops"
license=("MIT")
pkgver="2026.09.10"
pkgrel=1
arch=("any")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_repoowner/$_reponame/archive/refs/tags/${pkgver//./-}.tar.gz")
makedeps=("imagemagick" "dialog" "optipng" "inkscape")
sha512sums=("b2b353a8fb8161c307830390e888cbb4151046877ff189023f8bc73756ac4e37854642bb3bb384f1bbb40949bcd1d8d4f710f44aaaf3fbf9b721b90ac428b950")
url="https://github.com/$_repoowner/$_reponame"
options=("!debug")

package() {
    cd "$_reponame-${pkgver//./-}"

    mkdir -p "$pkgdir/usr/share/themes/"
    ./install.sh -HD -o solid -d "$pkgdir/usr/share/themes/"
}
