# Maintainer: Serge Victor <arch at random dot re>

pkgname=python-opterator
_pkgname=opterator
pkgver=0.5
pkgrel=1
pkgdesc="Opterator is an option parsing script for Python that takes the boilerplate out of option parsing."
arch=(any)
url="https://github.com/buchuki/opterator/"
source=("https://github.com/buchuki/${_pkgname}/archive/${pkgver}.tar.gz")
license=('MIT')
depends=('python>=3.2')
optdepends=()
provides=()
conflicts=()
md5sums=("3f48e185e1b602cd3b5706a8f1889995")


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="$pkgdir"
}
