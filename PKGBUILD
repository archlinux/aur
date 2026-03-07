# Maintainer: xuhcc <xuhcc@cryptolab.net>

pkgname='beancount-cryptoassets'
pkgdesc='Price sources for Beancount that provide prices for various cryptoassets'
pkgver=2.4.4
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-cryptoassets"
license=('GPL')
depends=('beancount')
optdepends=('beanprice: standalone bean-price package')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-cryptoassets/archive/v${pkgver}.tar.gz")
sha256sums=('b5e059eb9d45213bfac7c4f32ea6671cbcba91eee09505b996f9ff6383f05510')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
