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
sha256sums=('2271b78ee0de2113d96c81bd5a6c1c2c06fc2533b9820dd93ebff4b8329c0b38')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cconsole "$pkgdir/usr/bin/cconsole"
}
