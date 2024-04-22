# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-icons
pkgver=1.6.9
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka. Legacy version'
arch=('any')
url="https://github.com/linuxmint/mint-l-icons"
license=('GPL3')
depends=(
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
)
optdepends=(
    'mint-x-icons: enable additional icons to inheritage'
)
options=(!strip)
source=("http://packages.linuxmint.com/pool/main/m/$pkgname/${pkgname}_${pkgver}.tar.xz")
sha256sums=('5bcb3607ffedf565d6108406ffd427fecd39ebb19563712d02d829b0cf4d62f7')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
