# Maintainer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
pkgname=('xconvers')
pkgver="0.8.3"
pkgrel=1
arch=('i686' 'x86_64')
url="http://xconvers.sourceforge.net/"
license=('GPL2')
source=("ftp://ftp5.gwdg.de/pub/linux/slackware/slackware-11.0/extra/source/ham/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ad07ffb920b66445c9e46e8025e1ca58a62b01122d748351019af10d78e78f3a')
depends=('gtk')
pkgdesc="Xconvers is a client for the amateur radio convers system"


build(){
cd "${srcdir}/${pkgname}-${pkgver}/"
./configure --prefix=/usr
make
}


package(){
cd "${srcdir}/${pkgname}-${pkgver}/"
make DESTDIR="${pkgdir}" install
}

