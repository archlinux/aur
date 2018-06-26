# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-x-icons
pkgver=1.5.0
pkgrel=2
pkgdesc="A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=('gdk-pixbuf2' 
    'gtk-update-icon-cache'
    'hicolor-icon-theme')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('6604739fc28df77d5b860794f56674c216d590eadf559d6ec57841fde03d1765')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
