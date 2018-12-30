pkgname=python-sphinx-issues
pkgver=1.2.0
pkgrel=1
pkgdesc='Sphinx extension for referencing issues'
arch=(any)
url='https://github.com/sloria/sphinx-issues'
license=('MIT')
depends=('python-sphinx')
source=("https://github.com/sloria/sphinx-issues/archive/${pkgver}.tar.gz")
sha256sums=('4fe371f37d4e8a0e7a7f8ea6a6ff9007f284f4d849ca231480ff3744602a536e')

build() {
	cd "${srcdir}/sphinx-issues-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/sphinx-issues-${pkgver}"
	python setup.py install -O1 --skip-build --root="$pkgdir"
}
