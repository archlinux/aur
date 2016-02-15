# Maintainer: samæ <samæ at marvid dot fr>

_fnt_name=ostrich-sans
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=1
pkgdesc="A roman serif with blackletter elements."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
source=("https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
install=${pkgname}.install
md5sums=('a30ecf58162f9c40040fcf74fcaef916')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -d ${pkgdir}/usr/share/fonts/TTF

  install -Dm644 ${srcdir}/${_fnt_name}-master/*.otf          ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/*.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

