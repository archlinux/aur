# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-fcl
pkgver=0.7.0.5
pkgrel=1
pkgdesc="Python bindings for the Flexible Collision Library"
arch=('x86_64')
url="https://github.com/BerkeleyAutomation/python-fcl"
license=('GPL')
groups=()
depends=()
makedepends=(python-build python-installer python-wheel)
optdepends=()
provides=('python-fcl')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_py=cp311
source_x86_64=(https://files.pythonhosted.org/packages/$_py/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl)
noextract=()
md5sums_x86_64=('f4286584d79f65d65a5319c49d43effb')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
