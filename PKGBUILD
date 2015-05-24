# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=quake2-retexture
pkgver=1
pkgrel=1
pkgdesc="A true color retexture pak for Quetoo and other Quake2 engines supporting 32bpp tga textures"
arch=('i686' 'x86_64')
url="http://jdolan.dyndns.org/trac/wiki/Retexture"
license=('unknown')
makedepends=('unzip')
source=(http://tastyspleen.net/~jdolan/pak8.zip)
md5sums=('671fff24139c3e0012fffd052cf9f7cb')

build() {
  install -m644 -D $startdir/src/pak8.pak $startdir/pkg/usr/share/quake2/baseq2/pak8.pak
}
