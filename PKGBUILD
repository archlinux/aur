# Maintainer: SanskritFritz (gmail)
# Contributor: David Spicer <azleifel at googlemail dot com>

pkgname=ttf-lastwaerk
pkgver=1
pkgrel=4
pkgdesc="A clean, legible sans serif font."
arch=('any')
url="http://aajohan.deviantart.com/art/Lastwaerk-font-137804536"
license=('CCPL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://fc04.deviantart.net/fs50/f/2009/264/1/9/Lastwaerk___font_by_aajohan.zip")
md5sums=('7b2d6a3ef2d86e1ed1a3a42d46d79bba')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"

    cd "${srcdir}/Lastwaerk"
    install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm 644 "Please read me.txt" "${pkgdir}/usr/share/doc/$pkgname/README"
}
