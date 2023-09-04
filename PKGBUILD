# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/expect-language-server/blob/main/.github/workflows/main.yml
pkgname=expect-language-server
pkgver=0.0.1
pkgrel=1
pkgdesc="expect's language server"
arch=(any)
url=https://github.com/Freed-Wu/expect-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-pypandoc python-markdown-it-py)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('44b3fe6ecef56e48c49cfbe2fb2d1ae00c6bf1a9768801ff656dd52ba1a517b1')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
