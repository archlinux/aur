# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=1.3.6
pkgrel=1
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('a3ef151f7971d69769e7393f71373eaf896bccd22167213872ae46e04e14a2d7')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
