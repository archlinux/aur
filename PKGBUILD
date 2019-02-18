# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=praat-bin
_debpkg=praat
_debver=1
pkgver=6.0.47
pkgrel=1
pkgdesc="Doing Phonetics by computer (speech analysis)"
url="http://www.praat.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'alsa-lib' 'libpulse')
optdepends=('ttf-sil-fonts')
conflicts=('praat' 'praat-git')
source_i686=(http://http.us.debian.org/debian/pool/main/p/${_debpkg}/${_debpkg}_${pkgver}-${_debver}_i386.deb)
source_x86_64=(http://http.us.debian.org/debian/pool/main/p/${_debpkg}/${_debpkg}_${pkgver}-${_debver}_amd64.deb)
sha256sums_i686=('a223623e302b51b8beb6d73ae77a0b67349f334543b06d284a6de4783da6f629')
sha256sums_x86_64=('4e8b27d73a6c729b10b95c7edf1cdcd81735f6aec170d49c4914fd547bc13b5e')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
