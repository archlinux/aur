# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=0.33
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/freeassociation/'
license=('LGPL' 'MPL')
depends=('glibc')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/freeassociation/${pkgname}-${pkgver}.tar.gz")
md5sums=('6e25395678a0170f5da0433120ba91bf')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	./configure --prefix=/usr --enable-shared --disable-static
	make
	make DESTDIR=$pkgdir install
}
