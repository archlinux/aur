# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Roman Mikhayloff <rimf@inbox.ru>

pkgname=ttf-xo-tahion
pkgver=1.01 # The fake version, the original is unversioned.
pkgrel=1
pkgdesc="XO Tahion font created considering trends of modern typography from «Новые облачные технологии»"
arch=('any')
url="https://fonts.myoffice.ru"
license=('custom: XO FONTS Open License')
depends=('fontconfig' 'xorg-font-utils')
groups=('ttf-xo-fonts')
source=("XO_Tahion-${pkgver}.zip::http://fonts.myoffice.ru/wp-content/themes/template/fonts_page/files/XO_Tahion.zip")
sha256sums=('3fbcded935b80e78bd26528009de2fa654cd66924aa590a20531a8030338e41e')
install=${pkgname}.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
