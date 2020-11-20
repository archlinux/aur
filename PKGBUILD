# Maintainer: Martin Rys <https://rys.pw/#contact_me>

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=0.0.9
pkgrel=1
pkgdesc="Read metadata (tags) of mp3, mp4, wma, ogg, flac and aiff files (python3 version)"
url="https://pypi.org/project/deezer-py/"
arch=(any)
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('8dfc96109fa51b6b2a35f5dc2e3615b6c4c5966c7263f8516a6c5a10a4e1ec99')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
