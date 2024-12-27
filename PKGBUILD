# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beancount-exchangerates'
pkgdesc='Price source for Beancount that loads data from https://exchangerate.host/'
pkgver=5.1.1
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-exchangerates"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-exchangerates/archive/v${pkgver}.tar.gz")
sha256sums=('e7bf9b88acb8a28eca993c8530477c9bbba7753a2d8376401518748f9a30956c')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
