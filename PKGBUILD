# Maintainer: Martin Rys <https://rys.pw/#contact_me>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=0.0.13
pkgrel=1
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('db47074fbc17e7ae7ebd2f5fb3b55061ac4e34e6b4ec38a1bee847dddac9af80')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
