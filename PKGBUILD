# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.6.6
pkgrel=1
pkgdesc='A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza'
arch=('any')
url="https://github.com/linuxmint/mint-x-icons"
license=('GPL3')
depends=(
    'gdk-pixbuf2'
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
options=(!strip)
source=("http://packages.linuxmint.com/pool/main/m/$pkgname/${pkgname}_${pkgver}.tar.xz")
sha256sums=('1492eca83a5e42738063f5f14f61022761bdf40c542020b1c85f1e81f8144738')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
