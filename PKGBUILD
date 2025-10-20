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
sha256sums=('32f59511f568ecad0536ed5a1db3a81a10497e87a62dcbc48b77dbc421db450b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cconsole "$pkgdir/usr/bin/cconsole"
}
