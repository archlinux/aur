# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=praat-bin
_debpkg=praat
_debver=2
pkgver=6.0.49
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
sha256sums_i686=('e83da85e8ec04115a1b06f2748231a6a0cffe5f8daffc0e66446dddcc2399913')
sha256sums_x86_64=('e711ddad1b555321ea2a419eab199259dd0f6eacbb62f41051c189c2d5ce044c')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
