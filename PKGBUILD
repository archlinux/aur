# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beancount-exchangerates'
pkgdesc='Price source for Beancount that loads data from https://exchangerate.host/'
pkgver=3.1.0
pkgrel=2
arch=('any')
url="https://github.com/xuhcc/beancount-exchangerates"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-exchangerates/archive/v${pkgver}.tar.gz")
sha256sums=('fb87334397c134d02ebeacf9dbbeefec70a4376d98de7619727cd50df4ddea57')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
