# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=paclast
pkgver=r2
pkgrel=1
pkgdesc='list installed pacman packages in chronological order.'
arch=(any)
license=(GPL)
source=($pkgname)
provides=($pkgname)
conflicts=($pkgname)
sha256sums=('d3ed4f883f9c6029e3582e8d2f81918ba918a5f3577f3c2c928b6947e0f0001f')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
}
