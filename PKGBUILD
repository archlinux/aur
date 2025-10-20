# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=cshell
pkgver=0.0.2
pkgrel=1
pkgdesc="C version of Python shell"
arch=('any')
url="https://github.com/eshnd/cshell"
license=('MIT')
depends=()
makedepends=('gcc' 'make')
source=("cshell-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e26d9b34fb40df63ca70c79225111534c721350b13829ccc007a4fd0358f9e8b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 cshell "$pkgdir/usr/bin/cshell"
}
