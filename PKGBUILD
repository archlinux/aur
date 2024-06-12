# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.7.5
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
optdepends=(
    'mint-x-icons: enable additional icons to inheritage'
)
options=(!strip)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b19c9be822e33fc86dc9e95a176f44bd5aa0c74479efb5890b77941c777feee1')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
