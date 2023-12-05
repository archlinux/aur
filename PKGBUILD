# Maintainer:  dreieck

pkgname=mc-skin-modarcon16-whiteonblack
pkgver=20231205.01
pkgrel=1
pkgdesc="A white on black 16 colour Midnight Commander skin based on 'modarcon16'."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}"
license=('FDL1.3')
depends=('mc')
makedepends=()
source=("modarcon16-whiteonblack.ini")
sha256sums=('84296a3884d204e6d020b61d8cad3cdbcc900d2fdae6b79a3b77567ab4e9a071')

package() {
  install -Dvm644 'modarcon16-whiteonblack.ini' "${pkgdir}/usr/share/mc/skins/modarcon16-whiteonblack.ini"
}
