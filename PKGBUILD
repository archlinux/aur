# Packager: teraflops <cprieto.ortiz@gmail.com>
pkgname=pyroon
pkgver=0.1.6
pkgrel=1
pkgdesc="Python library for Roon API interaction"
arch=('any')
url="https://github.com/pavoni/pyroon"
license=('MIT')
depends=('python' 'python-requests' 'python-websocket-client')
makedepends=('git' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pavoni/pyroon/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7f43ac6d242bebef46f12fdc9600b32b5c60928989a0fe3bab5ec76ca098e826')

build() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    pip install . --root="$pkgdir" --no-deps --upgrade --ignore-installed
}

