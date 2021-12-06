# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.6.4
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
sha256sums=('269b1de4f8cce1ee367b7be4385dc67e34de2e6c451eeed9abe129478a96fe3d')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
