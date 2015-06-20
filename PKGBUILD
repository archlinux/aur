# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-takaomj
pkgver=15.03
pkgrel=1
_filever=00301.01
pkgdesc="Japanese outline fonts based on IPAmj Fonts (otf-ipamjfont)"
arch=('any')
url="https://launchpad.net/takao-fonts"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://launchpad.net/takao-fonts/trunk/${pkgver}/+download/TakaoMjFonts_${_filever}.tar.xz)

package() {
  cd "${srcdir}/TakaoMjFonts_${_filever}"

  install -d "${pkgdir}/usr/share/fonts/OTF"

  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt \
          README \
          README.ja \
          "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('e86ec5915e82a67f5ae19e110a203506')
