# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-ethereum-importer'
pkgdesc='Ethereum transaction importer for Beancount'
pkgver=1.2.1
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-ethereum-importer"
license=('GPL')
depends=('beancount')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-ethereum-importer/archive/v${pkgver}.tar.gz")
sha256sums=('b7ec0afbcafd7e43c406a6f660de60dcd60ee63dd88a81122ecc380018edd3d9')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
