# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=python-llvmcpy
pkgver=0.1.1
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
sha512sums=('6c03aa54180246eb6da87ea23ee11fbcf072becd9dfe263cbc61292156bd26d907ed65591922e96bc5c1bc20a4cb70491b938c0b47489fbd28fabfabeff3eabc')

package() {
  cd "$srcdir/llvmcpy-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
