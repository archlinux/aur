# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.6.3
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
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('7150e5dfb2353a0e5d62f5d528bc6249dfd9352ce9cdfde52ddbcafef94e5858')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
