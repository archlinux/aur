# Maintainer: samæ <samæ at marvid dot fr>

_fnt_name=league-script-number-one
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=1
pkgdesc="A modern, coquettish script font that sits somewhere between your high school girlfriend’s love notes and handwritten letters from the '20s."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
source=("https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
install=${pkgname}.install
md5sums=('d3dda08edd5ea88d12e223ea211d4fa2')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -d ${pkgdir}/usr/share/fonts/TTF

  install -Dm644 ${srcdir}/${_fnt_name}-master/*.otf  ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/*.ttf  ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

