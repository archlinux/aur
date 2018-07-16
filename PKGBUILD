pkgname=python-sphinx-issues
pkgver=1.0.0
pkgrel=1
pkgdesc='Sphinx extension for referencing issues'
arch=(any)
url='https://github.com/sloria/sphinx-issues'
license=('MIT')
depends=('python-sphinx')
source=("https://github.com/sloria/sphinx-issues/archive/${pkgver}.tar.gz")
sha256sums=('6fe08bc0bf89d4012eda09cb311a37a8640fbeafe4385627db0468b3d7782fad')

build() {
	cd "${srcdir}/sphinx-issues-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/sphinx-issues-${pkgver}"
	python setup.py install -O1 --skip-build --root="$pkgdir"
}
