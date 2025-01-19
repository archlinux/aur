# Maintainer: fenuks

pkgname=ropemode
pkgver=0.6.1
pkgrel=1
pkgdesc="Ropemode, a helper for using rope refactoring library in IDEs"
arch=("any")
url="https://pypi.python.org/pypi/${pkgname}"
license=("GPL")
depends=()
optdepends=()
makedepends=("python-setuptools")
conflicts=()
# install=$pkgname.install
source=("https://files.pythonhosted.org/packages/c3/d8/d4121e7b04fe8539faf4d600e6bb6a7630800b110a7ae6b5b2f8e7dfb205/ropemode-0.6.1.tar.gz")
sha256sums=('99b8d22df71be358e10cc435fb97140e57a50c42b846bd4a72491c5744dd0470')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
