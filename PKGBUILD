# Maintainer: Abigail G <dev@kb6.ee>

pkgname=gridtracker
pkgver=1.21.0322
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://gridtracker.org/grid-tracker/"
license=('BSD')
depends=('nwjs-bin>=0.48.0')
replaces=('gridtracker-bin')
source=("https://gitlab.com/gridtracker.org/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e56c921afe01b855827e176f37d3ded611bc909c6d6d9ad4cec87f8700dc998a')

package() {
    cd "$srcdir/$pkgname-v$pkgver/"
    make install DESTDIR=$pkgdir
}
