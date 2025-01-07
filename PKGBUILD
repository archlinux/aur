# Maintainer: Sterophonick
pkgname=gba-wav-to-s3m-converter-bin
pkgbase=gba-wav-to-s3m-converter
_pkgname='gba-wav-to-s3m-converter'
pkgver=1.4.0
pkgrel=1
pkgdesc='Segment wav music to be played in MaxMod on the GBA'
url='https://github.com/Fralacticus/gba-wav-to-s3m-converter'
arch=(x86_64)
source=(https://github.com/Fralacticus/gba-wav-to-s3m-converter/releases/download/1.4.0/gba-wav-to-s3m-converter-linux-1.4.0.zip)
md5sums=('8d5b1a15bc450d6aa6346f7a4e5d265e')
license=('zlib')
options=(!debug !strip)

package() {
  mkdir -p $pkgdir/usr/bin
  chmod +x $srcdir/gba-wav-to-s3m-converter
  cp $srcdir/gba-wav-to-s3m-converter $pkgdir/usr/bin
}
