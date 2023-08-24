# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/autoconf-language-server/blob/main/.github/workflows/main.yml
pkgname=autoconf-language-server
pkgver=0.0.2
pkgrel=1
pkgdesc="autoconf language server"
arch=(any)
url=https://github.com/Freed-Wu/autoconf-language-server
depends=(python-pygls python-platformdirs)
optdepends=(autoconf)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('62e5bc8f4aba88724fb2fc8efca952f7e37ded3fdac9869173faad433713fd59')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
