# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-x-icons
pkgver=1.5.1
pkgrel=1
pkgdesc="A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=('gdk-pixbuf2' 
    'gtk-update-icon-cache'
    'hicolor-icon-theme')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('36ec36dfd0f065f755a6bdf6a23192002c57a60b3569c58a59fefc18ae589a14')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
