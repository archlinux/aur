# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-ethereum-importer'
pkgdesc='Ethereum transaction importer for Beancount'
pkgver=1.4.2
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-ethereum-importer"
license=('GPL')
depends=('beancount')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuhcc/beancount-ethereum-importer/archive/v${pkgver}.tar.gz")
sha256sums=('d7565dfa3ca618b0f31bc4735bd34686ec5ed0bfb3cf57a1ddeb742f6639c439')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
