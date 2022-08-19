# Maintainer: Maroš Grego <maros@grego.site>
pkgname=blades-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Blazing fast dead simple static site generator"
url="https://www.getblades.org"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("blades")
options=("strip")
source=("https://github.com/grego/blades/releases/download/v$pkgver/blades-$pkgver-x86_64.tar.gz")
sha256sums=("23d88795f44158ab8066baf2eeab628d26d61aa4b54efb8e9de2a25ba86547aa")

package() {
    install -Dm755 blades -t "$pkgdir/usr/bin/"
}
