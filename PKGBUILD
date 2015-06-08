# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=acxi
pkgver=2.9.0
pkgrel=1
pkgdesc="An expanded, cleaned up, and feature enhanced fork of flac2ogg.pl to convert flac to ogg or mp3."
arch=(any)
url="http://techpatterns.com/forums/about1491.html"
license=('GPL')
depends=('perl' 'vorbis-tools' 'flac' 'lame')
source=("http://smxi.org/opt/acxi")
sha256sums=('f5dd977e010731466c53676b2facf421c233f91b61bf5556135ce09d892f0742')
install=readme.install

package() {
  cd "$srcdir"
  install -Dm755 acxi "$pkgdir/usr/bin/acxi"
}

# vim:set ts=2 sw=2 et:
