# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-midiutil
_reponame=MIDIUtil
pkgver=1.2.1
pkgrel=1
pkgdesc="Library to work with MIDI files"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('79fa983bd1efc60785f68a8fe78fa8f45b8d7ec5898bf7cb7f3f7f3336d6a90a')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
