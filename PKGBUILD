# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.9.6
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka'
arch=('any')
url="https://github.com/linuxmint/mint-y-icons"
_url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
optdepends=(
    'mint-x-icons: enable additional icons to inheritage'
)
options=(!strip)
source=("${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('d84a95a68a808cbcf82b29fa7e2bc4f3e74446574803e0b8e6f4e756f188ad3a')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
