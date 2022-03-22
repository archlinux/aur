# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-tensorflow-io-gcs-filesystem
_pkgname=tensorflow_io_gcs_filesystem
pkgver=0.24.0
pkgrel=1
pkgdesc="TensorFlow IO"
arch=(x86_64)
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python tensorflow)
_py=cp310
source=(https://files.pythonhosted.org/packages/${_py}/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-${_py}-${_py}-manylinux_2_12_${arch}.manylinux2010_${arch}.whl)
sha256sums=('b6ca3a9f751aa9c2f9851520e666d905ad14667281bbafeabe611b7b8f3e1bc5')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
