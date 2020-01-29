# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=bump2version
pkgver=1.0.0
pkgrel=2
pkgdesc='Version-bump your software with a single command! (bumpversion community fork)'
provides=('bumpversion')
conflicts=('bumpversion')
arch=('any')
url='https://github.com/c4urself/bump2version'
license=('MIT')
depends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/b/bump2version/bump2version-${pkgver}.tar.gz")

build() {
    cd "${srcdir}/bump2version-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/bump2version-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('cd4f3a231305e405ed8944d8ff35bd742d9bc740ad62f483bd0ca21ce7131984')
