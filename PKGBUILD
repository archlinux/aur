# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=python-llvmcpy
pkgver=0.1.5
pkgrel=1
pkgdesc="Python bindings for LLVM auto-generated from the LLVM-C API "
arch=(any)
url="https://rev.ng/llvmcpy"
license=('MIT')
depends=('python' 'python-cffi' 'python-pycparser' 'llvm')
makedepends=("git")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=("${pkgname}-git")
source=("https://github.com/revng/llvmcpy/archive/v${pkgver}.tar.gz")
sha512sums=('a14f53fe426426b2afd6fb9a387f9bdbba747de05d2c9c13049c29db73a5732cb46c3931a32135f655000b66d8d1586766de71d848258f3c6d31e0747230be2c')

package() {
  cd "$srcdir/llvmcpy-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
