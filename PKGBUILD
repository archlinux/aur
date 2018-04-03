# Maintainer: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>
webappname=google-maps
pkgname=${webappname}-desktop
pkgver=0.91
pkgrel=1
pkgdesc='Google Maps web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.svg" "$webappname.desktop")
md5sums=('2df570038db71ae0c8d6d4abdecf0f3a'
         '71d9d1a14e8aeddb70ed197ae3b15218'
         '79c8accd753c6b985dcd2d6b2238e049')

package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 "${srcdir}/$webappname.qtws" "${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws"
    install -Dm755 "${srcdir}/$webappname.desktop" "${pkgdir}/usr/share/applications/$webappname-desktop.desktop"
    install -Dm644 "${srcdir}/$webappname.svg" "${pkgdir}/usr/share/pixmaps/$webappname-desktop.svg"
}
 
