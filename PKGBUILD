# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-xformers-bin
_pkgname=xformers
_cp='cp312'
_cu='cu124'
pkgver=0.0.29.post2
pkgrel=2
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('x86_64')
url='https://github.com/facebookresearch/xformers'
license=(BSD-3-Clause)
depends=(python python-pytorch python-numpy)
provides=(python-xformers)
conflicts=(python-xformers)
makedepends=(python-installer python-wheel)
sha256sums=('0d0eb14db56cf08ec3fb9cb36ed5e98de1303411571539ca4dc080c5861e2744')
source=("https://download.pytorch.org/whl/${_cu}/xformers-${pkgver}-${_cp}-${_cp}-manylinux_2_28_${CARCH}.whl")
package() {
  python -m installer --destdir="$pkgdir" *.whl
}
# vim:set ts=2 sw=2 et:
