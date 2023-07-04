# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=xilinx-language-server
pkgname="python-$_pkgname"
pkgver=0.0.2
pkgrel=1
pkgdesc="xilinx language server"
arch=(any)
url=https://github.com/Freed-Wu/xilinx-language-server
depends=(python-pygls python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('590fb58585a1a24de609743df43b84c7446fd6e58fd7834494e0d22755dcb1ca')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
