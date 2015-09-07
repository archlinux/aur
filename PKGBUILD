# Maintainer: Spiros Georgaras <sng@hellug.gr>
pkgname=otf-pecita-font-stable
pkgver=5.2
pkgrel=1
pkgdesc="OpenType hand-written font whose letters are connected"
arch=('any')
license=('custom:OFL')
url="http://pecita.eu"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('http://members.hellug.gr/sng/AUR/pecita-5.2.tar.gz')
md5sums=('416dea5b7b8d26dc2ecc2e82f04b1bdb')
install=${pkgname}.install
replace=('otf-pecita' 'otf-pecita-v3')

package() {
install -d ${pkgdir}/usr/share/fonts/OTF
install -Dm644 ${srcdir}/*/*.otf ${pkgdir}/usr/share/fonts/OTF/
install -d ${pkgdir}/usr/share/licenses/${pkgname}/OFL
install -Dm644 ${srcdir}/*/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL
}
