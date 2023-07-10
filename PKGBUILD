# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-icons
pkgver=1.6.5
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka. Legacy version'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    gtk-update-icon-cache
    hicolor-icon-theme
)
optdepends=(
    'mint-x-icons: enable additional icons to inheritage'
)
provides=(mint-y-icons-legacy)
conflicts=(
    mint-y-icons-legacy
    mint-y-icons-legacy-git
)
options=(!strip)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('82e864d2cea0168fc95463b01b3eb5915a595ca7f1159a58ac720250b9ea4648')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
