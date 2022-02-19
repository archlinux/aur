# Menu_MiSTer for menu.rbf
# Maintainer: Alexandru M Stan <alex@hypertriangle.com>

buildarch=4

pkgname=mister-menu
pkgver=20210315
pkgrel=1
pkgdesc="FPGA bitstream loaded by uboot which shows the MiSTer menu"
arch=('any')
url='https://github.com/MiSTer-devel/Menu_MiSTer'
license=('GPL')
source=("https://github.com/MiSTer-devel/Menu_MiSTer/raw/master/releases/menu_${pkgver}.rbf")
sha256sums=('83fd161ebf925a41a0d28ab64805d0c4f1e6b1a1927027b49376c9fe43d040d9')

package_mister-menu() {
  install menu_${pkgver}.rbf -D "${pkgdir}"/boot/menu.rbf
}
