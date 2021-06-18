# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=paclast
pkgver=r4
pkgrel=1
pkgdesc='list installed pacman packages in chronological order.'
arch=(any)
license=(GPL)
source=($pkgname)
provides=($pkgname)
conflicts=($pkgname)
sha256sums=('13cd28bfb0086408fc75ff3666b99e8566bd0d92bad2987a79349b7fc8efeef6')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
}
