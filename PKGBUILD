# Menu_MiSTer for menu.rbf
# Maintainer: Alexandru M Stan <alex@hypertriangle.com>

buildarch=4

pkgname=mister-menu
pkgver=20220413
pkgrel=1
pkgdesc="FPGA bitstream loaded by uboot which shows the MiSTer menu"
arch=('armv7h')
url='https://github.com/MiSTer-devel/Menu_MiSTer'
license=('GPL')
source=("https://github.com/MiSTer-devel/Menu_MiSTer/raw/master/releases/menu_${pkgver}.rbf")
sha256sums=('01286520f2b8186c3f79e8a71fd8143efab4b8202274c65186711baef77b8dbf')

package_mister-menu() {
  install menu_${pkgver}.rbf -D "${pkgdir}"/boot/menu.rbf
}
