# Maintainer: Maroš Grego <maros@grego.site>
pkgname=blades-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Blazing fast dead simple static site generator"
url="https://www.getblades.org"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("blades")
options=("strip")
source=("https://github.com/grego/blades/releases/download/v$pkgver/blades-$pkgver-x86_64.tar.gz")
sha256sums=("4b9e2be3da54331d96a19f7fea1380e020659b4534109c9c60a24959d854ea72")

package() {
    install -Dm755 blades -t "$pkgdir/usr/bin/"
}
