# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beanprice'
pkgdesc='Price quotes fetcher for Beancount'
pkgver=2.1.0
pkgrel=1
arch=('any')
url="https://github.com/beancount/beanprice"
license=('GPL')
depends=(
    'beancount>=3.0.0'
    'python-dateutil'
    'python-requests'
    'python-diskcache'
)
provides=('beanprice')
conflicts=('beanprice-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beancount/beanprice/archive/v${pkgver}.tar.gz")
sha256sums=('4c6d80662399810a77d4650f8cd5844f88e3b5c96d8661e36a7872d91a5ff329')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
