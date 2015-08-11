# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-sawarabi-gothic
pkgver=20140215
_sfver=62786
pkgrel=1
pkgdesc="A gothic font for Japanese"
url="http://sawarabi-fonts.osdn.jp/"
license=('Creative Commons Attribution 3.0')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=(http://${_mirror}.dl.osdn.jp/sawarabi-fonts/${_sfver}/sawarabi-gothic-${pkgver}.tar.xz)

package() {
  cd "${srcdir}/sawarabi-gothic"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
}

md5sums=('8f7b5f433b649dd262ff64e197b461e0')
