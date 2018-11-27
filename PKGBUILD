# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.3.2
pkgrel=1
pkgdesc="A flat, colorful, and modern theme based on Paper and Moka"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=('gtk-update-icon-cache'
    'hicolor-icon-theme')
optdepends=('mint-x-icons: enable additional icons to inheritage')
conflicts=("mint-y-icons-git")
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('e327656780492de93804e7e0ec5e16893bd2e948709328ad6f2bab781738361d')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
