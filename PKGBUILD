# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/make-language-server/blob/main/.github/workflows/main.yml
pkgname=make-language-server
pkgver=0.0.3
pkgrel=1
pkgdesc="Makefile language server"
arch=(any)
url=https://github.com/Freed-Wu/make-language-server
depends=(python-pygls python-platformdirs)
optdepends=(make)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('994ade2c215ab45ca53c7b6a0866994e7d4ce35e969bf58ff7e395a6ea5e503a')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
