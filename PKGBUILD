# Maintainer: mcol <mcol@posteo.net>

# PKGBUILD @ mcol.xyz/code/aur-python-xkbcommon

pkgname=python-xkbcommon
pkgver=0.3
pkgrel=1
pkgdesc="Python bindings for libxkbcommon using cffi"
arch=(any)
license=('MIT')
url="https://github.com/sde1000/python-xkbcommon"
depends=('python-setuptools' 'libxkbcommon' 'python-cffi')
makedepends=()
sha256sums=('SKIP')
_commit="62c2d511475a04018cc14f13f660b5f63fd4ec0a"
source=("$url/archive/$_commit.tar.gz")

build() {
    cd "${srcdir}/$pkgname-$_commit"
    python setup.py build
}

package() {
    cd "${srcdir}/$pkgname-$_commit"
    python setup.py install --root="${pkgdir}"
}
