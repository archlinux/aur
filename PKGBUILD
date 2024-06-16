# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-icons
pkgver=1.7.1
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka. Legacy version'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
optdepends=(
    'mint-x-icons: enable additional icons to inheritage'
)
options=(!strip)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('cd2c0e8f01d37c8a53f6356dcdaf1df0c433b188e3e85c32f46a928eb8ba7c2c')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
