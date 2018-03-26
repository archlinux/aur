# Maintainer: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>
webappname=youtube
pkgname=${webappname}-desktop
pkgver=0.91
pkgrel=1
pkgdesc='YouTube web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.svg" "$webappname.desktop")
md5sums=('40f58dab4c9016eb8e188d9d139a9682'
         '241537903d64d8a0d6ad6b82c8998a70'
         'c17fe0b630bb961922e67b1be740a3c7')

package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 ${srcdir}/$webappname.qtws ${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws
    install -Dm755 ${srcdir}/$webappname.desktop ${pkgdir}/usr/share/applications/$webappname-desktop.desktop
    install -Dm644 ${srcdir}/$webappname.svg ${pkgdir}/usr/share/pixmaps/$webappname-desktop.svg
}
 
