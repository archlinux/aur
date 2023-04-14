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
source=(https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py2.py3-none-manylinux2010_x86_64.whl)
sha256sums=('a043138caaf2cb076ebb060c6281ec95612926645d425c691991fc9df00e8a24')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
