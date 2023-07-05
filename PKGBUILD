# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=autoconf-language-server
pkgname="python-$_pkgname"
pkgver=0.0.6
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
sha256sums=('2f517e994cc25e0c157393a621b54722042f06740f9ec10d12ccaac896a26799')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
