# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-limits
pkgver=1.3
pkgrel=1
pkgdesc="utilities to implement rate limiting"
url="https://github.com/alisaifee/limits/"
depends=('python' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/alisaifee/limits/archive/${pkgver}.tar.gz")
md5sums=('66563f666c0b0634105b46a8289e812e')

build() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/limits-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
