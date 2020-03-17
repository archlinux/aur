# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-limits
pkgver=1.5.1
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
depends=('python' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/alisaifee/limits/archive/${pkgver}.tar.gz")

sha256sums=('e48a7134c35c05312927c9b446ca34470e5bb21081414c00b17527fdd10fe296')

build() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
