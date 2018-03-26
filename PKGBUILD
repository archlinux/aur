# Maintainer: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>
webappname=google-photos
pkgname=${webappname}-desktop
pkgver=0.9
pkgrel=1
pkgdesc='Google Photos web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.svg" "$webappname.desktop")
md5sums=('d1fb07538cc1d3485263bbaa3d122206'
         'da3df6c6eaaba6ee9b2f3f0b3973efcb'
         '1b24fc333aaebd55476f5012aed246be')

package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 "${srcdir}/$webappname.qtws" "${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws"
    install -Dm755 "${srcdir}/$webappname.desktop" "${pkgdir}/usr/share/applications/$webappname-desktop.desktop"
    install -Dm644 "${srcdir}/$webappname.svg" "${pkgdir}/usr/share/pixmaps/$webappname-desktop.svg"
}
 
