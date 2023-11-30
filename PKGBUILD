# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-deltachat
_module='deltachat'
pkgver=1.131.4
_wheel=deltachat-${pkgver}-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
pkgrel=1
pkgdesc="Python bindings for the Delta Chat Core library using CFFI against the Rust-implemented libdeltachat"
url="https://pypi.org/project/deltachat/"
depends=(libdeltachat python-cffi python-imap-tools python-pluggy python-idna)
makedepends=(python-setuptools python-pkgconfig)
license=('MPL')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/1a/19/b5e1ff729bad1e98988095387ebb4d0e4164d11f1670d856735809778b32/${_wheel}")
sha256sums=('79cd036eee3287fa61c454240bb03bb5ec22a6e29e31193e8b6f4f6cbb16854b')
noextract=("${_wheel}")

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}/${_wheel}"
}
