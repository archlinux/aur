# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=paclast
pkgver=r3
pkgrel=1
pkgdesc='list installed pacman packages in chronological order.'
arch=(any)
license=(GPL)
source=($pkgname)
provides=($pkgname)
conflicts=($pkgname)
sha256sums=('6aade0d9786df1d3ba6002fcda11a1814f62c52fc2cf9ddea0e5eaafff6317ed')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
}
