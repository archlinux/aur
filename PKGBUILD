# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-windy
pkgver=1.00 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Windy font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('glibc')
groups=('ttf-xo-fonts')
source=("XO_Windy-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Windy.zip")
sha256sums=('11a712f7b30f98e3fd40cc8bfedf4b602f52ad75d7e239b67f389e4b6882c299')
install=${pkgname}.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
