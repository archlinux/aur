# Maintainer: nr0q <nr0q@gridtracker.org>
# Contributor: classabbyamp <dev@kb6.ee>

pkgname=gridtracker
pkgver=1.24.0801
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://gridtracker.org/"
license=('BSD')
depends=('nwjs-bin>=0.54.0')
replaces=('gridtracker-bin')
source=("https://gitlab.com/gridtracker.org/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('041b8c482d35ac252b8ee4208b8a8620e024098f4cd1a910161534d50c769f17')

package() {
    cd "$srcdir/$pkgname-v$pkgver/"
    make install DESTDIR=$pkgdir NO_DIST_INSTALL=true
}
