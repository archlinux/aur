pkgname=prettymath-git
_gitname=prettymath
pkgver=1.0
pkgrel=1
pkgdesc="Write prettified mathematical formulas to stdout using the magic of python and sympy"
arch=('any')
url=https://github.com/Quoteme/prettymath/
license=('GPL3')
depends=('python' 'python-sympy')
makedepends=('git')
source=(git+"https://github.com/Quoteme/${_gitname}.git")
sha256sums=('SKIP')
build() {
	cd ${_gitname}
	python setup.py build
}
package() {
	cd ${_gitname}
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# Maintainer: Luca Leon Happel <lucahappel99@gmail.com>
