# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-batch
pkgver=8.0.5
pkgrel=1
pkgdesc="Command line converter for draw.io diagrams"
arch=(any)
url="https://github.com/languitar/drawio-batch"
license=('APACHE')
depends=('python' 'phantomjs')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/drawio-batch/archive/${pkgver}.tar.gz")
md5sums=('72a3a48d405cf667f227df0ba82fee7b')

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
