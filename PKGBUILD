# Maintainer: nr0q <nr0q@gridtracker.org>
# Contributor: classabbyamp <dev@kb6.ee>

pkgname=gridtracker
pkgver=1.21.1212
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://gridtracker.org/grid-tracker/"
license=('BSD')
depends=('nwjs-bin>=0.48.0')
replaces=('gridtracker-bin')
source=("https://gitlab.com/gridtracker.org/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('38ca2ef414f0ff0d75821795673bf27fa868eb2fa4e89558e0168ee483e4a7ff')

package() {
    cd "$srcdir/$pkgname-v$pkgver/"
    make install DESTDIR=$pkgdir NO_DIST_INSTALL=true
}
