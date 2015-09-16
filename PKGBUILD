# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-sawarabi-mincho
pkgver=20150915
_sfver=63807
pkgrel=1
pkgdesc="A mincho font for Japanese"
url="http://sawarabi-fonts.osdn.jp/"
license=('Creative Commons Attribution 3.0')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=(http://${_mirror}.dl.osdn.jp/sawarabi-fonts/${_sfver}/sawarabi-mincho-${pkgver}.tar.xz)

package() {
  cd "${srcdir}/sawarabi-mincho"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
}

md5sums=('3f7c39fe27037f8c500a364dad0bdd22')
