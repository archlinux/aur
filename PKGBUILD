# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=plants-vs-zombies
pkgname=python-$_pkgname
pkgver=0.0.5
pkgrel=1
pkgdesc="a simple PlantsVsZombies game"
arch=(any)
url=https://github.com/marblexu/PythonPlantsVsZombies
depends=(python-pygame)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('c74a46fe7bda5c8f3f379e69c9584140af79d524a30b9ed255659ba9ce11eabb')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
