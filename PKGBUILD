# Maintainer: Dylan <dylan@flickmag.net>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-daemonocle
pkgver=1.0.1
pkgrel=1
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python-click' 'python-psutil')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/daemonocle/daemonocle-$pkgver.tar.gz")
sha256sums=('a8fc48d55f6390302a9a1816ad488cba640e70948f750d4c8fe5a401294dab68')

build() {
	cd "$srcdir/daemonocle-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/daemonocle-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
