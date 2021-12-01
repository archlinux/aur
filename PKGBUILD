# Maintainer: SanskritFritz (gmail)
# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=ttf-lastwaerk
pkgver=1
pkgrel=6
pkgdesc="A clean, legible sans serif font."
arch=('any')
url="http://aajohan.deviantart.com/art/Lastwaerk-font-137804536"
license=('CCPL')
# depends=('fontconfig' 'xorg-font-utils')
source=("lastwaerk_dafont.zip::https://dl.dafont.com/dl/?f=lastwaerk")
md5sums=('1ca8efa6c7c35cf91273e576ef135b0d')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm 644 "Please read me.txt" "${pkgdir}/usr/share/doc/$pkgname/README"
}
