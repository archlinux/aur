# Maintainer: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>
webappname=google-drive
pkgname=${webappname}-desktop
pkgver=0.91
pkgrel=1
pkgdesc='Google Drive web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.svg" "$webappname.desktop")
md5sums=('9a3ab99c171cc589db0a634967f17f89'
         '28df4c4d50f112a4de5a4867fa17125c'
         '571a650257cd731d12e46b818a4501af')

package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 "${srcdir}/$webappname.qtws" "${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws"
    install -Dm755 "${srcdir}/$webappname.desktop" "${pkgdir}/usr/share/applications/$webappname-desktop.desktop"
    install -Dm644 "${srcdir}/$webappname.svg" "${pkgdir}/usr/share/pixmaps/$webappname-desktop.svg"
}
 
