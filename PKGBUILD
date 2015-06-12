# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=pbftoosm
pkgver=1.0
pkgrel=4
pkgdesc="tool to convert from .pbf to .osm format"
arch=('i686' 'x86_64')
url="http://wiki.openstreetmap.org/wiki/Pbftoosm"
depends=('zlib')
license=('gpl')
source=("http://m.m.i24.cc/${pkgname}.c")
md5sums=('f8316f207012521491e81ae1de3488e7')

build() {
gcc -lz pbftoosm.c -o pbftoosm
}

package() {
install -Dm755 pbftoosm $pkgdir/usr/bin/pbftoosm
}
