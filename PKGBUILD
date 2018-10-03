# Maintainer: KbanKiller
pkgname=ttf-chivo
pkgver=1
pkgrel=1
pkgdesc='Chivo (Goat) is a new Omnibus-Type grotesque Sans Serif typeface family.'
arch=('any')
url='https://fonts.google.com/specimen/Chivo'
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
source=('https://fonts.google.com/download?family=Chivo')
sha256sums=('8d0b8818299ecb66d209d98441bba3b4e149fcea5ec3b91dac0da4828ebf2e42')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
