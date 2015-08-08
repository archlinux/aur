# Maintainer: Seba sebastian.zwierzchowski [AT] gmail [dot] com
pkgname=ttf-borders-divide-fonts
pkgver=20131024
pkgrel=1
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
pkgdesc="Borders Divide, But Hearts Shall Conquer TrueType Fonts"
arch=('any')
url="http://www.dafont.com/borders-divide-but-hearts-shall-conquer.font"
license=('custom:Free for pesonal use')
source=($pkgname.zip::http://dl.dafont.com/dl/?f=borders_divide_but_hearts_shall_conquer)
install=$pkgname.install
md5sums=('fdff37396a66334f70f079aaec0f8022')

package() {
  cd "${srcdir}" || return 1
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 'READ ME!!!!.txt' "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
