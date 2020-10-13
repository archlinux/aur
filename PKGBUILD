# Maintainer: Maroš Grego <maros@grego.site>
pkgname=blades-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Blazing fast dead simple static site generator"
url="https://www.getblades.org"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("blades")
options=("strip")
source=("https://github.com/grego/blades/releases/download/v$pkgver/blades-$pkgver-x86_64.tar.gz")
sha256sums=("811cff1edacf91b3ff0a831e1083c755ada141a26bff2300b2c6fa2ac183d035")

package() {
    install -Dm755 blades -t "$pkgdir/usr/bin/"
}
