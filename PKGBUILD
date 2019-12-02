# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.3.7
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
sha256sums=('dc9c799bbfc9a8c6059ddd6e634f7c4b748afc0b7c509484a54979e5820f3931')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
