# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-sawarabi-mincho
pkgver=20220815
_sfver=77638
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

md5sums=('4c8a7e9c441186dc09d954730ddcf0d8')
