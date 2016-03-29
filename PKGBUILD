#Maintainer: dawidd6
pkgname=minifetch
pkgver=1.0
pkgrel=1
pkgdesc="Minimal system info fetcher"
arch=('any')
url="https://github.com/dawidd6/minifetch"
license=('MIT')
provides=("minifetch")
conflicts=()
source=("https://github.com/dawidd6/minifetch/archive/$pkgver.tar.gz")
md5sums=('SKIP')

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}

