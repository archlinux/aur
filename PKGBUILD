# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.7.2
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
sha256sums=('30f2685ea97f3d2e1033d5423cc3ee36a02933e2aea6f09fccc845665c78c037')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
