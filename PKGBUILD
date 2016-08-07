# Contributor: tembleking <tembleking at gmail dot com>
pkgname=python2-gpxpy
pkgver=1.1.1
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=('Apache')
depends=('python2' 'python2-lxml>=3.1.2')
makedepends=('python2-setuptools')
provides=()
conflicts=("python-gpxpy")
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/g/gpxpy/gpxpy-${pkgver}.tar.gz)
sha256sums=('7c0353a5f7363d205d767c3df249b19ca68ea5c9421d93c44574d192b9d6f47a')

package() {
	cd "${srcdir}/gpxpy-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

