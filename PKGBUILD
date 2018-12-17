# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=python-requests-threads
pkgver=0.1.1
pkgrel=1
pkgdesc="Twisted Deferred Thread backend for Requests"
arch=('any')
url="https://github.com/requests/requests-threads"
license=('unknown')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://github.com/requests/requests-threads/archive/v$pkgver.tar.gz")
sha256=('')

build() {
  cd requests-threads-$pkgver
  python setup.py build
}

package() {
  cd requests-threads-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
sha256sums=('479292ad0f958fd2932365399fbc0e00dfa0185c409bfa35339cb8fbf66485fe')
