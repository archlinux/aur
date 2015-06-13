# Maintainer: SanskritFritz (gmail)
# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=ttf-montepetrum
pkgver=1
pkgrel=3
pkgdesc="A very tall, narrow, thin, sans serif font."
arch=('any')
url="http://aajohan.deviantart.com/art/Montepetrum-Font-151870278"
license=('CCPL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://fc01.deviantart.net/fs70/f/2010/027/f/5/Montepetrum___Font_by_aajohan.zip")
md5sums=('d631b527bec723d6fbd4324943672b13')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"

    cd "${srcdir}/Montepetrum"
    install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm 644 "Please read me.txt" "${pkgdir}/usr/share/doc/$pkgname/README"
}
