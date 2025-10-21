# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=cconsole
pkgver=0.1.1
pkgrel=1
pkgdesc="C version of Python console"
arch=('any')
url="https://github.com/eshnd/cconsole"
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("cconsole-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('54bbfc84c0fc648e6c0daa431294546e592b87f9dabf2f39a349da147f37befd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cconsole "$pkgdir/usr/bin/cconsole"
}
