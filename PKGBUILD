# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=nmon2rrd
pkgver=17b
pkgrel=1
pkgdesc="Filter to convert nmon output files to rrdtool format"
arch=('i686' 'x86_64')
url="https://github.com/jose1711/nmon2rrd"
license=("custom")
depends=('glibc')
source=("https://github.com/jose1711/nmon2rrd/archive/refs/tags/nmon17b.tar.gz")
md5sums=('eda33feb1290954a13ab2dfd9a739700')

build() {
cd $srcdir/nmon2rrd-nmon17b
pwd
ls
gcc -onmon2rrd nmon2rrd_17.c
}

package() {
cd $srcdir/nmon2rrd-nmon17b
install -D -m755 nmon2rrd $pkgdir/usr/bin/nmon2rrd
}
