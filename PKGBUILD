# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-libclang
_pkgname=${pkgname:7}
pkgver=14.0.1
pkgrel=1
pkgdesc="Clang Python Bindings"
arch=(x86_64)
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py2.py3-none-manylinux1_x86_64.whl)
sha256sums=('02bacd219959601c627872f2c7c7090ce57cf6bd497618388e41813c7ee75a3a')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
