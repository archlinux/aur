# Maintainer: oliver < a t >  first . in-berlin . de

pkgname=md5jpegdata
pkgver=1.2
pkgrel=1
pkgdesc="Tool to calculate the MD5 hashsum of the pure data part of a jpeg-file"
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://www.first.in-berlin.de/software/tools/md5jpegdata/md5jpegdata-1.2.tar.gz)
md5sums=('780a1378d278c9d4d9d9d3f25c42dd43')
url="http://www.first.in-berlin.de/software/tools/md5jpegdata/"
depends=('libgcrypt' 'libjpeg-turbo')
options=(!makeflags)

build() {
cd ${srcdir}/${pkgname}-${pkgver}
make
}


package() {
cd ${srcdir}/${pkgname}-${pkgver}
install -Dm 755 md5sumjpgdata ${pkgdir}/usr/bin/md5sumjpgdata   # install to Arch-Linux path
}
