# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=xilinx-language-server
pkgname="python-$_pkgname"
pkgver=0.0.3
pkgrel=1
pkgdesc="xilinx language server"
arch=(any)
url=https://github.com/Freed-Wu/xilinx-language-server
depends=(python-pygls python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('ed9305d920b30c38c5822b58d75bdcb07e7fc6f55a32f4a020f4daab9e139d14')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
