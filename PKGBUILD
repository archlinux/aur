# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=osmupdate
pkgver=0.4.1
pkgrel=1
pkgdesc="a tool to download and cumulate .osc OsmChange files of different categories (minutely, hourly, daily)"
arch=('i686' 'x86_64')
url="http://wiki.openstreetmap.org/wiki/Osmupdate"
license=("gpl")
depends=('glibc')
source=("http://m.m.i24.cc/osmupdate.c")
md5sums=('740162c2400a5e8c78a1bd9a79993242')

build() {
cd $srcdir
gcc -oosmupdate osmupdate.c
}

package() {
install -Dm755 $srcdir/osmupdate $pkgdir/usr/bin/osmupdate
}
