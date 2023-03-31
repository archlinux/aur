# Maintainer: Adrian Room <ingolemo@gmail.com>

_pkgname="flake8_simplify"
pkgname="python-${_pkgname//_/-}"
pkgver=0.19.2
pkgrel=1
pkgdesc="A flake8 plugin that helps you simplify your code."
arch=('any')
url="https://github.com/MartinThoma/flake8-simplify/"
license=('MIT')
depends=('flake8' 'python-astor')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_pkgname::1}/${_pkgname//_/-}/${_pkgname}-$pkgver-py3-none-any.whl")
md5sums=('ee1b98a55af98c1b4cf6158f14603338')

package() {
	python -m installer --destdir="$pkgdir" *.whl
}
