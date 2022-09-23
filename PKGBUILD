# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-caliburn
pkgver=1.01 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Caliburn font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
groups=('ttf-xo-fonts')
source=("XO_Caliburn-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Caliburn.zip")
sha256sums=('4dcf6f4e009effca1342bdab27689ec230be1483cb18dad74f7a7b372f1d4f8d')
install=${pkgname}.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
