# Maintainer: SanskritFritz (gmail)
# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=ttf-montepetrum
pkgver=1
pkgrel=5
pkgdesc="A very tall, narrow, thin, sans serif font."
arch=('any')
url="http://aajohan.deviantart.com/art/Montepetrum-Font-151870278"
license=('CCPL')
# depends=('fontconfig' 'xorg-font-utils')
source=("montepetrum_dafont.zip::https://dl.dafont.com/dl/?f=montepetrum")
md5sums=('1aee8b73cf337c1fe8c59a5a2f75f126')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm 644 "Please read me.txt" "${pkgdir}/usr/share/doc/$pkgname/README"
}
