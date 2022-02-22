# Maintainer: Adrian Room <ingolemo@gmail.com>

pkgname="python-flake8-simplify"
_pkgname="flake8-simplify"
pkgver=0.18.0
pkgrel=1
pkgdesc="A flake8 plugin that helps you simplify your code."
arch=('any')
url="https://github.com/MartinThoma/flake8-simplify/"
license=('MIT')
depends=('flake8' 'python-astor')
source=("https://github.com/MartinThoma/flake8-simplify/archive/$pkgver.tar.gz")
md5sums=('06ebed3adc9ec3e2e087fde2e231ede7')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
