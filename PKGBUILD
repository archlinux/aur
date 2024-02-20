# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tmux-language-server/blob/main/.github/workflows/main.yml
pkgname=tmux-language-server
pkgver=0.0.4
pkgrel=1
pkgdesc="tmux's language server"
arch=(any)
url=https://github.com/Freed-Wu/tmux-language-server
depends=(python-tree-sitter-lsp python-tree-sitter-tmux)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('c382a663c85050876152e0deb56927494a00e9c7054ae45d892c73cf983be7e5')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
