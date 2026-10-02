# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.9.5
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
sha256sums=('b5bc2bcfe1e960696cf10cc2138f6569491b29329019c555c44246d46e0b7d74')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
