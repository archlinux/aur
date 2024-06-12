# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-icons
pkgver=1.7.0
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka. Legacy version'
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
sha256sums=('1ea9a614f47f39a0b93a0b857a4e735141b12ac46920c47fa3768881d1f335c5')

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr "${pkgdir}"
}
