# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=autoconf-language-server
pkgname="python-$_pkgname"
pkgver=0.0.7
pkgrel=1
pkgdesc="autoconf language server"
arch=(any)
url=https://github.com/Freed-Wu/autoconf-language-server
depends=(python-pygls python-platformdirs)
optdepends=(autoconf)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('71afce4b52f15ff8f65c7951b0d7c78120e2a1ef88df21371428dbab3135eb04')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
