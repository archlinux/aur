pkgname=python-tlslite-ng
pkgver=0.8.0
pkgrel=1
pkgdesc="Pure python implementation of SSL and TLS"
url="https://github.com/tomato42/tlslite-ng"
arch=('any')
license=('custom:mixed free licenses')
depends=("python-ecdsa")
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomato42/tlslite-ng/archive/v${pkgver}.tar.gz")
md5sums=('3d54cee098c82ac1b9e4243ed07dcf75')

package() {

    cd tlslite-ng-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
