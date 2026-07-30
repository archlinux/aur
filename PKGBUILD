# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-fcl
pkgver=0.7.0.11
pkgrel=1
pkgdesc="Python bindings for the Flexible Collision Library"
arch=('x86_64')
url="https://github.com/BerkeleyAutomation/python-fcl"
license=('GPL')
makedepends=(python-installer)
_py=cp314
source_x86_64=(https://files.pythonhosted.org/packages/$_py/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-$_py-${_py}-manylinux_2_24_x86_64.manylinux_2_28_x86_64.whl)
sha256sums_x86_64=('8b11738c65aec8e701070cd9990c378b977216f403927601c9029e140c8f8716')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
