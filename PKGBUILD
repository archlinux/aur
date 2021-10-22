# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=1.2.5
pkgrel=1
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('25c7b23014052c3ddf44f6fd9c994639237b8800ae246f1d9a515f3a186c60a7')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
