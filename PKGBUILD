# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-batch
pkgver=8.0.1
pkgrel=1
pkgdesc="Command line converter for draw.io diagrams"
arch=(any)
url="https://github.com/languitar/drawio-batch"
license=('APACHE')
depends=('python' 'phantomjs')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/drawio-batch/archive/${pkgver}.tar.gz")
md5sums=('63a1456042ccb442dc1b0d9f2c0ee952')

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
