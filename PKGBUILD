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
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('d0a8d773351fd17b95fee81dfbcbf98577b567dcdbec47d221b0ee258432101d')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
