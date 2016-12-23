# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-sawarabi-gothic
pkgver=20161015
_sfver=66581
pkgrel=1
pkgdesc="A gothic font for Japanese"
url="http://sawarabi-fonts.osdn.jp/"
license=('Creative Commons Attribution 3.0')
arch=('any')
depends=('fontconfig')
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=(http://${_mirror}.dl.osdn.jp/sawarabi-fonts/${_sfver}/sawarabi-gothic-${pkgver}.tar.xz)

package() {
  cd "${srcdir}/sawarabi-gothic"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
}

md5sums=('0e3f2aefb1bc0a4638b72e0679b0f92c')
