# Maintainer: Maroš Grego <maros@grego.site>
pkgname=blades-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Blazing fast dead simple static site generator"
url="https://www.getblades.org"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("blades")
options=("strip")
source=("https://github.com/grego/blades/releases/download/v$pkgver/blades-$pkgver-x86_64.tar.gz")
sha256sums=("9068952660a5a30e13796a6f8ae1925c82900fef31e83cecc3c7369c2f8f3d2f")

package() {
    install -Dm755 blades -t "$pkgdir/usr/bin/"
}
