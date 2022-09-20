# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-symbol-mac
pkgver=1.00 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Symbol (macOS) font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
groups=('ttf-xo-fonts')
source=("XO_SymbolM-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_SymbolM.zip")
sha256sums=('e06fb4c615de110423c04a5dda3e993a64903a6b1d420da6258a250792de8924')
install=${pkgname}.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
