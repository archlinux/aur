# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=python-llvmcpy
pkgver=0.1.6
pkgrel=1
pkgdesc="Python bindings for LLVM auto-generated from the LLVM-C API "
arch=(any)
url="https://rev.ng/llvmcpy"
license=('MIT')
depends=('llvm' 'python' 'python-appdirs' 'python-cffi' 'python-packaging' 'python-pycparser')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=("${pkgname}-git")
source=("https://github.com/revng/llvmcpy/archive/v${pkgver}.tar.gz")
sha512sums=('fcfb0773888e0412b96831d5e2b00aad27f36f1d22a5d8f48d1e1be659e21ebd859e2e3c2e8c6bf12a4cf414ca2c21c926421f18e2a31250029c00e9edd19709')

package() {
  cd "$srcdir/llvmcpy-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
