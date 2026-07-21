# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/xilinx-language-server/blob/main/.github/workflows/main.yml
pkgname=xilinx-language-server
pkgver=0.0.6
pkgrel=1
pkgdesc="xilinx language server"
arch=(any)
url=https://github.com/Freed-Wu/xilinx-language-server
depends=(python-pygls python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('5ebda45aa383c04b68062b48830486ac60c45eb4816e5001f53979856585b865')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
