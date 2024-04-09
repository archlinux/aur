# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=plants-vs-zombies
pkgname=python-$_pkgname
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=(any)
url=https://github.com/marblexu/PythonPlantsVsZombies
depends=(python-pygame)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('8bfae4d34c040c8640ef773bca172d28c6b9605f4da4561fd2afe91c37244fc5')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
