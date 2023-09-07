# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Asuka Minato

pkgname=ttf-saginaw
pkgver=20160615
pkgrel=1
pkgdesc="Saginaw Calligraphy Font"
arch=('any')
url="http://www.urbanfonts.com/fonts/Saginaw.htm"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
source=("local://saginaw.zip")
install=${pkgname}.install
sha256sums=('58cd8888d03868a1eef076ed0d747c9e4067f6c9678a27b1fb9aab135407a1b3')

package() {
    install -Dm644 ${srcdir}/SaginawBold.ttf ${pkgdir}/usr/share/fonts/TTF/SaginawBold.ttf
    install -Dm644 ${srcdir}/SaginawLight.ttf ${pkgdir}/usr/share/fonts/TTF/SaginawLight.ttf
    install -Dm644 ${srcdir}/SaginawMedium.ttf ${pkgdir}/usr/share/fonts/TTF/SaginawMedium.ttf  
}
