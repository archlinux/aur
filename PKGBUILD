# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.7.4
pkgrel=1
pkgdesc='A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza'
arch=('any')
url="https://github.com/linuxmint/mint-x-icons"
_url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
    'gdk-pixbuf2'
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
options=(!strip)
source=("${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('538ca8528d92f059652bd03d475b041ae926c630c22fed2a3afc7fa689a6025e')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
