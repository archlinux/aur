# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-x-icons
pkgver=1.7.3
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
sha256sums=('dcf303f824845194e100c09586447cb27dc6ccf980af7201ed690f9a97e3c897')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
