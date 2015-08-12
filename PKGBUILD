# Maintainer: Spiros Georgaras <sng@hellug.gr>
pkgname=otf-pecita-font-stable
pkgver=4.3
pkgrel=2
pkgdesc="OpenType hand-written font whose letters are connected"
arch=('any')
license=('custom:OFL')
url="http://pecita.eu"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('http://members.hellug.gr/sng/AUR/pecita-4.3.tar.gz')
md5sums=('e2fb13bee02fbbc0a988a8854ec6638f')
install=${pkgname}.install
conflicts=('otf-pecita' 'otf-pecita-v3')

package() {
install -d ${pkgdir}/usr/share/fonts/OTF
install -Dm644 ${srcdir}/*/*.otf ${pkgdir}/usr/share/fonts/OTF/
install -d ${pkgdir}/usr/share/licenses/${pkgname}/OFL
install -Dm644 ${srcdir}/*/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL
}
