# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=1.2.2
pkgrel=1
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('a491af5fcc9e44a2a28be8832169e703a920dae42c78539f45cad59075700ac9')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
