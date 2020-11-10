# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-ethereum-importer'
pkgdesc='Ethereum transaction importer for Beancount'
pkgver=1.2.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-ethereum-importer"
license=('GPL')
depends=('beancount')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-ethereum-importer/archive/v${pkgver}.tar.gz")
sha256sums=('cbf1591c41ad64b37950a21ecdbc4b8b61cf09047a59afd782e69df7aafcba1d')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
