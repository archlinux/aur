# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-takaoex
pkgver=15.03
pkgrel=3
_filever=00201.01
pkgdesc="Japanese outline fonts based on IPAex Fonts (otf-ipaexfont)"
arch=('any')
url="https://launchpad.net/takao-fonts"
license=('custom')
depends=()
source=(http://launchpad.net/takao-fonts/trunk/${pkgver}/+download/TakaoExFonts_${_filever}.tar.xz)
md5sums=('52990c7691b50b9d588456920abedc8b')

package() {
  cd "${srcdir}/TakaoExFonts_${_filever}"

  install -d "${pkgdir}/usr/share/fonts/OTF"

  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt \
          README \
          README.ja \
          "${pkgdir}/usr/share/licenses/${pkgname}/"
}
