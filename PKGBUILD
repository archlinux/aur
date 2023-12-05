# Maintainer:  dreieck

pkgname=mc-skin-whitegreenpurple256
pkgver=20231205.01
pkgrel=1
pkgdesc="A black on white 256 colour Midnight Commander skin based on 'gray-green-purple256'."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}"
license=('FDL1.3')
depends=('mc')
makedepends=()
source=("white-green-purple256.ini")
sha256sums=('33197c50910802d29d60c2af7f362eb1d557a77b46ae123258e6a9097300bb0c')

package() {
  install -Dvm644 'white-green-purple256.ini' "${pkgdir}/usr/share/mc/skins/white-green-purple256.ini"
}
