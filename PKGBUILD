# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-ethereum-importer'
pkgdesc='Ethereum transaction importer for Beancount'
pkgver=1.1.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-ethereum-importer"
license=('GPL')
depends=('beancount')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-ethereum-importer/archive/v${pkgver}.tar.gz")
sha256sums=('2e5a87f6e41d6555366ce82908d45993de3866978222b399cb6c5977912cfeda')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
