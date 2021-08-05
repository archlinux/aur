# Maintainer: librewish <librewish@gmail.com>

pkgname=kde-servicemenus-setaswallpaper
pkgver=1
pkgrel=1
pkgdesc="KDE service menus for set as wallpaper from dolphin"
arch=('any')
license=('GPL')
depends=('dolphin')
source=("SetAsWallpaper.desktop")
sha256sums=('ea3f0d7a2cf9df122b363434d97bc32e9cee74f092082cf51144cbcfbae8f539')

package() {
  install -dm 755 ${pkgdir}/usr/share/kservices5/ServiceMenus/
  install -m 644 *.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
}
