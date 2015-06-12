# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=nmonmerge
pkgver=2
pkgrel=2
pkgdesc="Filter to join two nmon output files into one"
arch=('i686')
url="http://www-941.haw.ibm.com/collaboration/wiki/display/WikiPtype/nmon"
license=("custom")
source=("http://www.ibm.com/developerworks/wikis/download/attachments/53871937/${pkgname}2.tar.gz?version=1")
md5sums=('6e3e0dd9b3c873a0bd472d1c72a3a261')
depends=('glibc')

build() {
cd $srcdir
gcc -D LINUX -onmonmerge2 nmonmerge2.c
}

package() {
install -Dm755 $srcdir/nmonmerge2 $pkgdir/usr/bin/nmonmerge2
}
