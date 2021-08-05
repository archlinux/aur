# Maintainer: librewish <librewish@gmail.com>

pkgname=kde-servicemenus-sendtodesktop
pkgver=1
pkgrel=1
pkgdesc="KDE service menus for sending files to desktop from dolphin"
arch=('any')
license=('GPL')
depends=('dolphin')
source=("sendToDesktop.desktop")
sha256sums=('71589c650e3c2d43d3b7d4d45824b9744da497d4134e242446c33f368fdbeae4')

package() {
  install -dm 755 ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 *.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
}
