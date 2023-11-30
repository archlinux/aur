# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.6.9
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
sha256sums=('9bff516c224f6717320f434e14678a1b5fbff1951bc33c77c6847c74ba3f13e3')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
