# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beancount-cryptoassets'
pkgdesc='Price sources for Beancount that provide prices for various cryptoassets'
pkgver=2.4.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-cryptoassets"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-cryptoassets/archive/v${pkgver}.tar.gz")
sha256sums=('290fab11166302dacc08e19106b7d80475979e8422ce88c6186fd009c1c24880')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
