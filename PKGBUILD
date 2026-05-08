pkgname=lapifetch
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple bunny-themed Linux fetch utility"
arch=('x86_64')
url="https://github.com/asunyan-dev/lapifetch"
license=('MIT')
depends=('gcc')

source=("$pkgname-$pkgver.tar.gz::https://github.com/asunyan-dev/lapifetch/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 lapifetch "$pkgdir/usr/bin/lapifetch"
}
