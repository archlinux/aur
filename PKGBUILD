# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.5.0
pkgrel=1
pkgdesc='A flat, colorful, and modern theme based on Paper and Moka'
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
conflicts=(
    mint-y-icons-git
)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('fd2916cf9bdd6b7db57b194c95cc48a6fa2180f9e6fe908e1e3035ed4de2cc10')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
