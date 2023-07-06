# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=xilinx-language-server
pkgname="python-$_pkgname"
pkgver=0.0.4
pkgrel=1
pkgdesc="xilinx language server"
arch=(any)
url=https://github.com/Freed-Wu/xilinx-language-server
depends=(python-pygls python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('77d63919b15613445969bb8c095ea626cadf652cc16f812c7007478acc3870f3')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
