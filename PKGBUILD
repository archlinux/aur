# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beancount-exchangerates'
pkgdesc='Price source for Beancount that loads data from https://exchangerate.host/'
pkgver=4.0.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-exchangerates"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-exchangerates/archive/v${pkgver}.tar.gz")
sha256sums=('3bf486780910821136ce411302eb8e3875bf40b52604c19fe0888958ffb6a04e')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
