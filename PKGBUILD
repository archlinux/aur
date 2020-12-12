# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-cryptoassets'
pkgdesc='Price sources for Beancount that provide prices for various cryptoassets'
pkgver=2.3.1
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-cryptoassets"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-cryptoassets/archive/v${pkgver}.tar.gz")
sha256sums=('ed27eb0c3ba009925d3e4e7bdd6590f7c296560a706c030135721b3fa3ff9f15')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
