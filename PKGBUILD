# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=drawio-batch
pkgver=8.2.2
pkgrel=1
pkgdesc="Command line converter for draw.io diagrams"
arch=(any)
url="https://github.com/languitar/drawio-batch"
license=('APACHE')
depends=('python' 'phantomjs')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/drawio-batch/archive/${pkgver}.tar.gz")
md5sums=('3b4ff4383834845349017a8413cae248')

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
