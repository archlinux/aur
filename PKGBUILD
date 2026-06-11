pkgname=croi-ng
pkgver=1.0.0
pkgrel=1
pkgdesc='Network and IoT security scanner for red teamers'
arch=('x86_64' 'aarch64')
url='https://github.com/jasuasau/Croi-ng'
license=('custom')
depends=('libpcap' 'ncurses' 'lua54')
makedepends=('base-devel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasuasau/Croi-ng/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Croi-ng-$pkgver"
    make
}

package() {
    cd "$srcdir/Croi-ng-$pkgver"
    make DESTDIR="$pkgdir" install
}
