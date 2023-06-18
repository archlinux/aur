# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=autoconf-language-server
pkgname="python-$_pkgname"
pkgver=0.0.4
pkgrel=1
pkgdesc="autoconf language server"
arch=(any)
url=https://github.com/Freed-Wu/autoconf-language-server
depends=(python-pygls python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('c9a99506fe23fbad2ca3a73d14919c626c4e52bc354950d14a2de906069d2de0')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
