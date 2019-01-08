# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=praat-bin
_debpkg=praat
_debver=3
pkgver=6.0.46
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
sha256sums_i686=('3e874f19781f587f49bc48c01ba067233b9a0c0aa0c0f2206faeb8df627d5c5f')
sha256sums_x86_64=('e57215570ac222624b7269c349a8d6d3ba3a1ee9910f2a123723d6487063cf1f')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
