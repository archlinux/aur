# Maintainer: Slash
# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=quake2-retexture
pkgver=1
pkgrel=1
pkgdesc="A true color retexture pak for Quetoo and other Quake2 engines supporting 32bpp tga textures"
arch=('any')
url="http://quetoo.org/"
license=('unknown')
source=('http://tastyspleen.net/~jdolan/pak8.zip')
sha256sums=('2d1e3d11c26ec14e49b7334be66f205c7554aaa3309c0702c11d54ec0e0cd437')

package() {
  install -m644 -D "${srcdir}/pak8.pak" \
      "${pkgdir}/usr/share/quake2/baseq2/pak8.pak"
}

