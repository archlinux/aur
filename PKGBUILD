# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.5.9
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
options=(!strip)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('1ee54f850231055dd03a12e23be2c53f730e504ac4509bea94ada1e3fbcc768d')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
