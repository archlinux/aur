# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=autoconf-language-server
pkgname="python-$_pkgname"
pkgver=0.0.5
pkgrel=2
pkgdesc="autoconf language server"
arch=(any)
url=https://github.com/Freed-Wu/autoconf-language-server
depends=(python-pygls python-platformdirs)
optdepends=(autoconf)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('2c0bfe116104d9eca6cfc581debfdf1256a2d427a17cdade725f87666a5b71df')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
