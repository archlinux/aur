# Maintainer: Martin Rys <https://rys.pw/#contact_me>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=1.0.4
pkgrel=1
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('73396d09b5ba1b0e3365b6b68b38dd16af71ccb6b825d328cf6740a0cce7a75c')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
