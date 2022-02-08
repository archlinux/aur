# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
pkgname=paclast
pkgver=r5
pkgrel=2
pkgdesc='list installed pacman packages in chronological order.'
arch=(any)
license=(GPL)
source=($pkgname)
sha256sums=('ba8b0c1d478313d5fef710acb713e687e9c33e54b20269c9f246dfcc1a996d32')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
}
