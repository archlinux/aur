# Maintainer: user6553591 <Message on Reddit>

pkgname=('python-websockets')
pkgver=3.2
pkgrel=2
pkgdesc="An implementation of the WebSocket Protocol (RFC 6455)"
arch=('any')
url="https://github.com/aaugustin/websockets"
license=('custom:BSD')
depends=('python')
source=("$pkgver.tar.gz::https://github.com/aaugustin/websockets/archive/$pkgver.tar.gz")
sha256sums=('cc6620f33b5d68f7f36cc82f2fb947a92f572f569c3f905b232bcf81623e6128')

package() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py install --optimize=1 --root="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
