pkgname=python-tlslite-ng
pkgver=0.8.1
pkgrel=1
pkgdesc="Pure python implementation of SSL and TLS"
url="https://github.com/tomato42/tlslite-ng"
arch=('any')
license=('custom:mixed free licenses')
depends=("python-ecdsa")
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomato42/tlslite-ng/archive/v${pkgver}.tar.gz")
md5sums=('86a5f43febdddb46864f3e5203141b7c')

package() {

    cd tlslite-ng-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
