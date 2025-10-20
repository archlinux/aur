# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=cshell
pkgver=0.0.3
pkgrel=1
pkgdesc="C version of Python shell"
arch=('any')
url="https://github.com/eshnd/cshell"
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("cshell-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e16a85cb7d527f73f8aa4d6c91c6af6cb5a1439eb198ff1429e8c6cae4831e1d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cshell "$pkgdir/usr/bin/cshell"
}
