# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=sublime-syntax-language-server
pkgname="python-$_pkgname"
pkgver=0.0.2
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
sha256sums=('0f819d3d0a4eae147fa0f3305a0337e0d76e16e6a73477e42b530713b6993c38')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
