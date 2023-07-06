# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=sublime-syntax-language-server
pkgname="python-$_pkgname"
pkgver=0.0.3
pkgrel=1
pkgdesc="sublime-syntax language server"
arch=(any)
url=https://github.com/Freed-Wu/sublime-syntax-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-beautifulsoup4)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('fa28463d52904f15d392175e8e935c3520e18130dfc3fa249df2f2a027d4c714')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
