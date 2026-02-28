# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=torchao
pkgname=python-$_pkgname
pkgver=0.16.0
pkgrel=1
pkgdesc="Package for applying ao techniques to GPU models"
arch=(x86_64)
url=https://pytorch.org/ao/stable/index.html
depends=(python-pytorch)
makedepends=(python-installer)
license=(BSD-3-Clause)
_py=py3
source=("https://download.pytorch.org/whl/nightly/cu129/torchao-0.16.0.dev20251231%2Bcu129-cp310-abi3-manylinux_2_24_x86_64.manylinux_2_28_x86_64.whl")
sha256sums=('ffe9d25ed53b7e30a893c9adde595e13dc773b1ea6cdf2305abac0bc5f8f187f')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
