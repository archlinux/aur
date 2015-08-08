# Maintainer: James Morris - jwm-art - james@jwm-art.net
pkgname=ttf-djb-zora-prints-fonts
pkgver=20141016
pkgrel=1
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
pkgdesc="DJB Zora Prints TrueType Fonts"
arch=('any')
url="http://darcybaldwin.com/djb-zora-prints-font/"
license=('custom:Free for pesonal use')
source=($pkgname.zip::http://dl.dafont.com/dl/?f=djb_zora_prints license.txt)
install=$pkgname.install
md5sums=('fb9df581c51f84457c7a4de90c84491f'
         'ed2c7c1b65aecc8d7bfb85ed3c32bf10')

package() {
  cd "${srcdir}" || return 1
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
