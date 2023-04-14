# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-libclang
_pkgname=${pkgname:7}
pkgver=16.0.0
pkgrel=1
pkgdesc="Clang Python Bindings"
arch=(x86_64)
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py2.py3-none-manylinux1_x86_64.whl)
sha256sums=('e429853939423f276a25140b0b702442d7da9a09e001c05e48df888336947614')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
