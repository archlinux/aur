# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-y-icons
pkgver=1.3.5
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
sha256sums=('cbc983f3bb315558bcadbbe90bd77dcf266312a807a48282d697e329aea7b6c5')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
