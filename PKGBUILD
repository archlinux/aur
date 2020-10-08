# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-cryptoassets'
pkgdesc='Price sources for Beancount that provide prices for various cryptoassets'
pkgver=2.2.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-cryptoassets"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-cryptoassets/archive/v${pkgver}.tar.gz")
sha256sums=('8c7044fbdd47cd0a2b7ba5d7b1cb19bc43d106fce58bfeced4583490be6b6a66')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
