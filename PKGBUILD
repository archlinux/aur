# Maintainer: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>
webappname=netflix
pkgname=${webappname}-qdesktop
pkgver=0.91
pkgrel=1
pkgdesc='Netflix web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.svg" "$webappname.desktop")
md5sums=('acd05375f04e385eb0c5e7ea4f991778'
         'bb2e2f9ffb15061126229ef19464e58e'
         '61730709cbde4e0cb8250d94e1dccc58')

package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 ${srcdir}/$webappname.qtws ${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws
    install -Dm755 ${srcdir}/$webappname.desktop ${pkgdir}/usr/share/applications/$webappname-desktop.desktop
    install -Dm644 ${srcdir}/$webappname.svg ${pkgdir}/usr/share/pixmaps/$webappname-desktop.svg
}
 
