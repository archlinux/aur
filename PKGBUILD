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
sha256sums=('cff8ead808e9328b12ae53d8152febc505ce7acafd5299b7d01684e8f81b85f2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cshell "$pkgdir/usr/bin/cshell"
}
