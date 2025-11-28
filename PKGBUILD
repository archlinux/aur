# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.8.9
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
sha256sums=('c522e3eb21bd2868a10a0c364c8dd46d81210d5ffee3133c5cdb747a442d71c9')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
