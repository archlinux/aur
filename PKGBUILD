# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/zathura-language-server/blob/main/.github/workflows/main.yml
pkgname=zathura-language-server
pkgver=0.0.7
pkgrel=1
pkgdesc="zathura's language server"
arch=(any)
url=https://github.com/Freed-Wu/zathura-language-server
depends=(python-pygls python-platformdirs 'python-tree-sitter-lsp>=0.0.9' 'python-tree-sitter-zathurarc>=0.0.3' python-webcolors)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('63755cc34dd5eee7c866a01b6e01e44137c8d545b9381d63951e1cc078839807')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
