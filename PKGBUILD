# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beancount-exchangerates'
pkgdesc='Price source for Beancount that loads data from https://exchangerate.host/'
pkgver=5.1.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-exchangerates"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-exchangerates/archive/v${pkgver}.tar.gz")
sha256sums=('ff541eff9eba9b50997e25f666a78318f28bb18718dbcd3f1c52af465fcf3b66')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
