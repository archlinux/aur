# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-libclang
_pkgname=${pkgname:7}
pkgver=13.0.0
pkgrel=1
pkgdesc="Clang Python Bindings"
arch=(x86_64)
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py2.py3-none-manylinux1_x86_64.whl)
sha256sums=('9c1e623340ccafe3a10a2abbc90f59593ff29f0c854f4ddb65b6220d9d998fb4')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
