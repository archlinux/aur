# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-icons
pkgver=1.6.8
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka. Legacy version'
arch=('any')
url="https://github.com/linuxmint/mint-x-icons"
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
sha256sums=('fc2628f60979f3c574eded4a97cb783d557fbba28ed33f9a2182ac923777b1ed')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
