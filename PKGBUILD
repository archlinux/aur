# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=autoconf-language-server
pkgname="python-$_pkgname"
pkgver=0.0.1
pkgrel=1
pkgdesc="autoconf language server"
arch=(any)
url=https://github.com/Freed-Wu/autoconf-language-server
depends=(python-pygls python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('623a7dbf37eba28257c4276420d6b42b816326cb9faee64b65716410a3a1a3e3')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
