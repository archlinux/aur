# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=("python-tlslite-ng" "python2-tlslite-ng")
pkgbase="python-tlslite-ng"
pkgver=0.7.5
pkgrel=1
pkgdesc="Pure python implementation of SSL and TLS"
url="https://github.com/tomato42/tlslite-ng"
arch=('any')
license=('custom:mixed free licenses')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomato42/tlslite-ng/archive/v${pkgver}.tar.gz")
md5sums=('45e5b1991037f1e215f79916d8a1cc77')

package_python-tlslite-ng() {
    depends=("python-ecdsa")

    cd tlslite-ng-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-tlslite-ng() {
    depends=("python2-ecdsa")

    cd tlslite-ng-${pkgver}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
