# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=paclast
pkgver=r1
pkgrel=1
pkgdesc='list installed pacman packages in chronological order.'
arch=(any)
license=(GPL)
source=($pkgname)
provides=($pkgname)
conflicts=($pkgname)
sha256sums=('8366aa817d76125f1ffaa2428dfa1fa0ac220050f07c0d09d3fa8cc2cd4b3da0')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
}
