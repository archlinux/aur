# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=cshell
pkgver=0.0.4
pkgrel=1
pkgdesc="C version of Python shell"
arch=('any')
url="https://github.com/eshnd/cshell"
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("cshell-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d41c7adea02c38b9ab32db60d75542be0fdfbc27f326d840b30d5ddbcb0f337')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cshell "$pkgdir/usr/bin/cshell"
}
