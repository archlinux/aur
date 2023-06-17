# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-autoconf-language-server
pkgver=0.0.0
pkgrel=1
pkgdesc="autoconf language server"
arch=(any)
url=https://github.com/Freed-Wu/autoconf-language-server
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=(SKIP)

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
