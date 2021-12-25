# Maintainer: Maroš Grego <maros@grego.site>
pkgname=blades-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Blazing fast dead simple static site generator"
url="https://www.getblades.org"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("blades")
options=("strip")
source=("https://github.com/grego/blades/releases/download/v$pkgver/blades-$pkgver-x86_64.tar.gz")
sha256sums=("ed58bdca9d34eae77a223e9f1b12201f0791236848d343fae6d122e2adf6f340")

package() {
    install -Dm755 blades -t "$pkgdir/usr/bin/"
}
