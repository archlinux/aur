# Maintainer: KbanKiller
pkgname=ttf-chivo
pkgver=1.0
pkgrel=2
pkgdesc='Chivo (Goat) is a new Omnibus-Type grotesque Sans Serif typeface family.'
arch=('any')
url='https://fonts.google.com/specimen/Chivo'
license=('SIL OPEN FONT LICENSE Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("${pkgname}.zip::https://fonts.google.com/download?family=Chivo")
sha256sums=('80642634535921e96ca17a3cc1a0f74299a325c4339ffa81688898ba156631d0')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
