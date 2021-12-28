# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=1.3.2
pkgrel=1
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('1b819111cf8f5af6a98673aecc178fada8f8a478268612aab3254728e3f01a29')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
