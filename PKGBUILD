# Maintainer: Pau Ruiz Safont <unduthegun at gmail dot com>

pkgname=otf-yanone-kaffeesatz
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="The free OpenType Yanone Kaffeesatz font"
arch=('any')
url='http://www.yanone.de/typedesign/kaffeesatz/'
license=('Creative Commons')
install=${pkgname}.install
source=('https://www.yanone.de/2015/data/UIdownloads/Yanone%20Kaffeesatz.zip')
md5sums=('e1bb666675f715e0c01ceb086a7784cb')

package()
{
    cd ${srcdir}
    install -d ${pkgdir}/usr/share/fonts/OTF
    install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
}


