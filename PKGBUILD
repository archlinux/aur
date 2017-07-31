# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=("python-tlslite-ng" "python2-tlslite-ng")
pkgbase="python-tlslite-ng"
pkgver=0.7.0
pkgrel=1
pkgdesc="Pure python implementation of SSL and TLS"
url="https://github.com/tomato42/tlslite-ng"
arch=('any')
license=('custom:mixed free licenses')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomato42/tlslite-ng/archive/v${pkgver}.tar.gz")
md5sums=('211421bcce57a99566f8a4458e5663c6')

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
