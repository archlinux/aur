# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.6.5
pkgrel=1
pkgdesc='A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    gdk-pixbuf2
    gtk-update-icon-cache
    hicolor-icon-theme
)
options=(!strip)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('f1c83432f4fe3aea021f28c235d28878367ff9f77bbd7a44391becfa914c6a85')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
