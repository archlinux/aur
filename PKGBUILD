# Maintainer: Martin Rys <https://rys.pw/#contact_me>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=0.0.10
pkgrel=2
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('3c4bb2e03d0429b080fe079a85e67df917e425daec769bf79f2fe4d1004e033e')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
