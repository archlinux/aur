# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=praat-bin
_debpkg=praat
_debver=1
pkgver=6.0.48
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
sha256sums_i686=('b59cda75b823db03411e61b93db3dacc7ce05b26d3166cede8f345bcfeef3abd')
sha256sums_x86_64=('53d392d669d940087ec0b136823e91c4ff4dcf4bd720f8370c0ab110954de7d2')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
