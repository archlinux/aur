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
sha256sums=('064245e55b123744d44024a64a4fbcfbfb107f6c7e68cb21cde71c2a69d0e069')

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr "${pkgdir}"
}
