# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beanprice'
pkgdesc='Price quotes fetcher for Beancount'
pkgver=2.0.0
pkgrel=1
arch=('any')
url="https://github.com/beancount/beanprice"
license=('GPL')
depends=('beancount>=3.0.0' 'python-dateutil' 'python-requests')
provides=('beanprice')
conflicts=('beanprice-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/beancount/beanprice/archive/v${pkgver}.tar.gz")
sha256sums=('b1b2c6f66fc1823da8393ae5bb182b858985e71c0e6929a968ee1ed6532cf4e7')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
