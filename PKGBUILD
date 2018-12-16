# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.3.3
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
sha256sums=('ff6179396182bbe35fab66e17f471f08a2ec5e9071a4e6b3de13ab615b0791de')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
