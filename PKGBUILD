# Maintainer: Kasper Sacharias Roos Eenberg <kse@mahavira.dk>
pkgname=ijvm-tools
pkgver=0.9
pkgrel=1.0
pkgdesc="Implementation of the IJVM machine described in the book Structured Computer Organization"
provides=('ijvm')
arch=('x86_64')
url="https://users-cs.au.dk/bouvin/dComArk/2015/noter/Note_2/"
license=('GPL2')
source=("ijvm-tools-${pkgver}.tar.gz::https://users-cs.au.dk/bouvin/dComArk/2015/noter/Note_2/ijvm-tools-${pkgver}.tar.gz")
sha512sums=('29fb6076b30a63cf3db64f96972928e1a4c281defcc71fa124a795be1dc3f10322cd11e0bc880adfa50d0be423e8f45826c7515bdd90f52e5258053e700ed1bc')

build() {
	cd ijvm-tools-${pkgver}
	./configure --prefix ${pkgdir}/usr
	make
}

package() {
	cd ijvm-tools-${pkgver}
	make install
}
