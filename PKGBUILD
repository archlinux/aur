# Maintainer:Tamer <el.blackhat at gmail dot com>
# Contributor:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: schuay <jakob dot gruber at gmail dot com>

pkgname=maitreya
_pkgname=maitreya8
pkgver=8.2
pkgrel=4
pkgdesc='A free software for Vedic and western astrology'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.saravali.de/maitreya.html"
depends=('wxwidgets-gtk3')
source=("https://github.com/martin-pe/maitreya8/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('c5326cc2a5fe0aea1b34c9b290e6410d')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install

}

