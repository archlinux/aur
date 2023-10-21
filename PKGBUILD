# Maintainer: nr0q <nr0q@gridtracker.org>
# Contributor: classabbyamp <dev@kb6.ee>

pkgname=gridtracker
pkgver=1.23.1019
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://gridtracker.org/"
license=('BSD')
depends=('nwjs-bin>=0.54.0')
replaces=('gridtracker-bin')
source=("https://gitlab.com/gridtracker.org/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('7f79df735b16cd6b549be9f435828c2878361e652f4a9f993ad7e70bdb37ed60')

package() {
    cd "$srcdir/$pkgname-v$pkgver/"
    make install DESTDIR=$pkgdir NO_DIST_INSTALL=true
}
