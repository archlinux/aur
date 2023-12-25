# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tmux-language-server/blob/main/.github/workflows/main.yml
pkgname=tmux-language-server
pkgver=0.0.2
pkgrel=1
pkgdesc="tmux's language server"
arch=(any)
url=https://github.com/Freed-Wu/tmux-language-server
depends=(python-pygls python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('158a42cbf377d97159f789cc79baeb2fb6a71ca149c261b8e15fca39e31f5ba5')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
