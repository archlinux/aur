# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=super-mario
pkgname=python-$_pkgname
pkgver=0.0.1
pkgrel=1
pkgdesc="a improved supermario game"
arch=(any)
url=https://github.com/marblexu/PythonPlantsVsZombies
depends=(python-pygame)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}_game-$pkgver-$_py-none-any.whl")
sha256sums=('b85da52d7bf06dda1eb8fd35d951bf1576e2bdd94bb2f6442e776a3f66373b0c')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
