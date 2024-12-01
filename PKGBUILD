# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-xformers-bin
_pkgname=xformers
pkgver=0.0.28.post3
pkgrel=1
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('x86_64')
url='https://github.com/facebookresearch/xformers'
license=(BSD-3-Clause)
depends=(python python-pytorch python-numpy)
provides=(python-xformers)
conflicts=(python-xformers)
makedepends=(python-installer python-wheel)
sha256sums=('c550f72bb4e55b67bd847e9272b7f41d27ac82b6b99f35a710a1292f2f218a3a')
source=("https://files.pythonhosted.org/packages/01/ba/048171c15dfd4f9bff63aaf6e93586ea1ea3e14cc66cd2cea59a50fc2047/xformers-${pkgver}-cp312-cp312-manylinux_2_28_x86_64.whl")
package() {
  python -m installer --destdir="$pkgdir" *.whl
}
# vim:set ts=2 sw=2 et:
