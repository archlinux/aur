# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=python-parsing-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A pure-Python module that implements an LR(1) parser generator, as well as CFSM and GLR parser drivers."
arch=('x86_64')
url="http://www.canonware.com/Parsing/"
license=('MIT')
provides=("python-parsing=${pkgver}")
depends=('python>=3.7')
makedepends=('python-pip')

package() {
	pip install --root=$pkgdir parsing
}
