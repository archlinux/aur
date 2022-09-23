# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-oriel
pkgver=1.01 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Oriel font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
groups=('ttf-xo-fonts')
source=("XO_Oriel-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Oriel.zip")
sha256sums=('6de2ce1a34c6e697ba95f9c698674387ae55f39ee26ffcd11a526ce12d285f36')
install=${pkgname}.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
