# Maintainer: Spiros Georgaras <sng@hellug.gr>
pkgname=otf-pecita-font-stable
pkgver=5.3
pkgrel=1
pkgdesc="OpenType hand-written font whose letters are connected"
arch=('any')
license=('custom:OFL')
url="http://pecita.eu"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('http://members.hellug.gr/sng/AUR/pecita-5.3.tar.gz')
md5sums=('392880b0000b8f38541642f082e9e02a')
install=${pkgname}.install
replace=('otf-pecita' 'otf-pecita-v3')

package() {
install -d ${pkgdir}/usr/share/fonts/OTF
install -Dm644 ${srcdir}/*/*.otf ${pkgdir}/usr/share/fonts/OTF/
install -d ${pkgdir}/usr/share/licenses/${pkgname}/OFL
install -Dm644 ${srcdir}/*/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL
}
