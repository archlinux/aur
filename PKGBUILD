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
sha256sums=("cf8bacc7059a2d0c0fe054d717b60ba56181329535f947ec84f83706cef0f1dd")

package() {
    install -Dm755 blades -t "$pkgdir/usr/bin/"
}
