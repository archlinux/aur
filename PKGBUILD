# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=praat-bin
_debpkg=praat
pkgver=6.0.43
pkgrel=1
pkgdesc="Doing Phonetics by computer (speech analysis)"
url="http://www.praat.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'alsa-lib' 'libpulse')
optdepends=('ttf-sil-fonts')
source_i686=(http://http.us.debian.org/debian/pool/main/p/${_debpkg}/${_debpkg}_${pkgver}-1_i386.deb)
source_x86_64=(http://http.us.debian.org/debian/pool/main/p/${_debpkg}/${_debpkg}_${pkgver}-1_amd64.deb)
sha256sums_i686=('6e040fc35fcaf8f245167e9aaed1d2623503eb1968de3e347f3264e3fabd05d8')
sha256sums_x86_64=('997fb418127e19b2aa6acbf4eb0808cbe08c1f0ddd52dd92db59828df8bc0db5')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
