# Maintainer:Tamer <el.blackhat at gmail dot com>

pkgname=maitreya
_pkgname=maitreya8
pkgver=8.0.1b
pkgrel=3
pkgdesc='A free software for Vedic and western astrology'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.saravali.de/maitreya.html"
source=("https://github.com/martin-pe/maitreya8/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('2b30482d1d51412d3a4767cea626b595')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install

}

