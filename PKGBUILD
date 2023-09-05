# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/sublime-syntax-language-server/blob/main/.github/workflows/main.yml
pkgname=sublime-syntax-language-server
pkgver=0.0.4
pkgrel=1
pkgdesc="sublime-syntax language server"
arch=(any)
url=https://github.com/Freed-Wu/sublime-syntax-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-beautifulsoup4)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('8acb79eeeb4c2a14c37a2cf7a7950f5939d383a8b6114c955ef30b2a41fdb8ea')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
