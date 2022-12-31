# Maintainer: nr0q <nr0q@gridtracker.org>
# Contributor: classabbyamp <dev@kb6.ee>

pkgname=gridtracker
pkgver=1.22.1226
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://gridtracker.org/grid-tracker/"
license=('BSD')
depends=('nwjs-bin>=0.54.0')
replaces=('gridtracker-bin')
source=("https://gitlab.com/gridtracker.org/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('08b4428600d8198e14e0af875ff149efec76a1d4ebe7ab82d394bc22d3ef6fde')

package() {
    cd "$srcdir/$pkgname-v$pkgver/"
    make install DESTDIR=$pkgdir NO_DIST_INSTALL=true
}
