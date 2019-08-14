# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-exchangerates'
pkgdesc='Price source for Beancount that loads data from http://exchangeratesapi.io/'
pkgver=2.0.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-exchangerates"
license=('GPL')
depends=('beancount')
source=("https://github.com/xuhcc/beancount-exchangerates/archive/v${pkgver}.tar.gz")
sha256sums=('35e12d8ce9c52087e409db27400a3c93c7574cc796b1ecf83359698ac883b282')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
