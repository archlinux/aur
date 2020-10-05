# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-exchangerates'
pkgdesc='Price source for Beancount that loads data from http://exchangeratesapi.io/'
pkgver=2.0.1
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-exchangerates"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-exchangerates/archive/v${pkgver}.tar.gz")
sha256sums=('820543dc7967afeb612c1b88c3d7c148c6809bf55f91366092c573a86d3b49f3')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
