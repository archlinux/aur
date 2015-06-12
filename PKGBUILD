# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=osmchange
pkgver=0.7
pkgrel=2
pkgdesc="a tool to merge .osc OsmChange files into an .osm Planet file"
arch=('i686' 'x86_64')
url="http://wiki.openstreetmap.org/wiki/Osmchange_(program)"
license=("gpl")
depends=('glibc')
source=("http://m.m.i24.cc/osmchange.c")
md5sums=('2b9f24e758e150aa68572fd73b87045b')

build() {
cd $srcdir
gcc -oosmchange osmchange.c
}

package() {
install -Dm755 $srcdir/osmchange $pkgdir/usr/bin/osmchange
}
