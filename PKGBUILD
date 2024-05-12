# Maintainer: nr0q <nr0q@gridtracker.org>
# Contributor: classabbyamp <dev@kb6.ee>

pkgname=gridtracker
pkgver=1.24.0504
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://gridtracker.org/"
license=('BSD')
depends=('nwjs-bin>=0.54.0')
replaces=('gridtracker-bin')
source=("https://gitlab.com/gridtracker.org/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('2cb43f0511b9880ab1b773f5d25f1f8d3827b661f9971ece404b6110d3364131')

package() {
    cd "$srcdir/$pkgname-v$pkgver/"
    make install DESTDIR=$pkgdir NO_DIST_INSTALL=true
}
