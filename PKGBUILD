# Maintainer: Saurabh Kumar Sharma <saurabh000345@gmail.com> 
webappname=youtube-music
pkgname=${webappname}-desktop
pkgver=1.0
pkgrel=1
pkgdesc='YouTube Music web-app based on qtws'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtws-base')
source=("$webappname.qtws" "$webappname.png" "$webappname.desktop")
md5sums=('a631b8125712a7ccd1b57e03c1d45b91'
         '54dcc4edaf29caa9524c89b7de8862d7'
         '338db3530a8c308e0d4e6206d5fbb800')

package() {
    mkdir -p ${pkgdir}/usr/share/qtws-apps/$webappname
    echo ${srcdir}
    
    install -Dm644 ${srcdir}/$webappname.qtws ${pkgdir}/usr/share/qtws-apps/$webappname/$webappname.qtws
    install -Dm755 ${srcdir}/$webappname.desktop ${pkgdir}/usr/share/applications/$webappname-desktop.desktop
    install -Dm644 ${srcdir}/$webappname.png ${pkgdir}/usr/share/pixmaps/$webappname-desktop.png
}
