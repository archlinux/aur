# Maintainer: user6553591 <Message on Reddit>

pkgname=('python-websockets')
pkgver=3.2
pkgrel=1
pkgdesc="An implementation of the WebSocket Protocol (RFC 6455)"
arch=('any')
url="https://github.com/aaugustin/websockets"
license=('custom:BSD')
makedepends=('python')
source=("$pkgver.tar.gz::https://github.com/aaugustin/websockets/archive/$pkgver.tar.gz")
md5sums=('97643620ddb773db37cedda8462d62c1')

package() {
    depends=('python')
    cd "$srcdir"/websockets-$pkgver
    python setup.py install --root="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
