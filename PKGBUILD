# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-exchangerates'
pkgdesc='Price source for Beancount that loads data from https://exchangerate.host/'
pkgver=3.0.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-exchangerates"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-exchangerates/archive/v${pkgver}.tar.gz")
sha256sums=('6cfc9262c807f519bf5af5490c5695f91466094cdc79e99fbfced1eb02a434bf')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
