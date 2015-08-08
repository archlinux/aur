# Maintainer: James Morris - jwm-art - james@jwm-art.net
pkgname=ttf-berylium-fonts
pkgver=20081231
pkgrel=1
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
pkgdesc="Berylium TrueType Fonts"
arch=('any')
url="http://www.fontsquirrel.com/fonts/Berylium"
license=('custom:Larabie Fonts License v1.00')
source=($pkgname.zip::http://www.fontsquirrel.com/fonts/download/Berylium)
install=$pkgname.install
md5sums=('997a58428cc15e71b7c36528dace48aa')

package() {
  cd "${srcdir}" || return 1
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 'Larabie Fonts License.txt' "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
