# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-ethereum-importer'
pkgdesc='Ethereum transaction importer for Beancount'
pkgver=1.3.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-ethereum-importer"
license=('GPL')
depends=('beancount')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-ethereum-importer/archive/v${pkgver}.tar.gz")
sha256sums=('92132e02ac07c5506c1a8b158a3b64abe5d1d5c203325795485a9ed372ccd21c')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
