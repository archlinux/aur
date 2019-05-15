# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=praat-bin
_debpkg=praat
_debver=2
pkgver=6.0.52
pkgrel=1
pkgdesc="Doing Phonetics by computer (speech analysis)"
url="http://www.praat.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'alsa-lib' 'libpulse')
optdepends=('ttf-sil-fonts')
conflicts=('praat' 'praat-git')
source_i686=(http://http.at.debian.org/debian/pool/main/p/${_debpkg}/${_debpkg}_${pkgver}-${_debver}_i386.deb)
source_x86_64=(http://http.at.debian.org/debian/pool/main/p/${_debpkg}/${_debpkg}_${pkgver}-${_debver}_amd64.deb)
sha256sums_i686=('caff99337c9ecfb8476ef3d6da9cb2df6907bd406a63081736f33a63e0b1b950')
sha256sums_x86_64=('6ea02ecb32eee6f6346cc40a9cf36a08f41f885e2144769ff2ed0b3351778f32')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
