# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

pkgname=praat-bin
pkgver=6.1.09
_debver=1
pkgrel=2
pkgdesc='Doing Phonetics by computer (speech analysis)'
url='http://www.praat.org/'
arch=('x86_64' 'i686')
license=('GPL')
depends=('alsa-lib' 'gtk2' 'libpulse' 'jack' 'ttf-charis-sil' 'ttf-sil-doulos')
optdepends=('ttf-sil-fonts')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_i686=("http://http.at.debian.org/debian/pool/main/p/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-${_debver}_i386.deb")
source_x86_64=("http://http.at.debian.org/debian/pool/main/p/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-${_debver}_amd64.deb")
sha256sums_x86_64=('2882b371c3fce0263ad46f5f4517a9475a2d7a211b6494ad81a85e04a278ee6e')
sha256sums_i686=('df82e4e672c6d782b92ae6181b6893d0722b58be709a600f0d887ebff09074f8')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
