# Maintainer: samæ <samæ at marvid dot fr>
# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=ttf-abibas
pkgver=20150814
pkgrel=3
pkgdesc="Blacklatter abibas knows ελληνικά and русский as well as most European languages."
arch=('any')
url="http://openfontlibrary.org/fr/font/abibas"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('http://openfontlibrary.org/assets/downloads/abibas/092dc4247e773d0afefd04bf237516cb/abibas.zip'
	'OFL.txt')
install=${pkgname}.install
md5sums=('092dc4247e773d0afefd04bf237516cb'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package() {
  install -Dm644 ${srcdir}/Abibas.otf ${pkgdir}/usr/share/fonts/OTF/Abibas.otf
  install -Dm644 ${srcdir}/Abibas.ttf ${pkgdir}/usr/share/fonts/TTF/Abibas.ttf
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/ttf-abibas/OFL.txt
}
