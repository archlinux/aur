# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-sawarabi-mincho
pkgver=20161215
_sfver=66872
pkgrel=1
pkgdesc="A mincho font for Japanese"
url="http://sawarabi-fonts.osdn.jp/"
license=('Creative Commons Attribution 3.0')
arch=('any')
depends=('fontconfig')
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=(http://${_mirror}.dl.osdn.jp/sawarabi-fonts/${_sfver}/sawarabi-mincho-${pkgver}.tar.xz)

package() {
  cd "${srcdir}/sawarabi-mincho"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
}

md5sums=('d8149a97b6d24e9d6b6b2ef711356c12')
