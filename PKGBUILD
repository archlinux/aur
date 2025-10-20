# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=cconsole
pkgver=0.1.0
pkgrel=1
pkgdesc="C version of Python console"
arch=('any')
url="https://github.com/eshnd/cconsole"
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("cconsole-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74eadaef6407a55673949c222fd69bc58e9f4599ad4c667d1890fde24825e892')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cconsole "$pkgdir/usr/bin/cconsole"
}
