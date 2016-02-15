# Maintainer: samæ <samæ at marvid dot fr>

_fnt_name=blackout
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="A bad-ass, unholy-mother-shut-your-mouth stencil sans-serif."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
install=${pkgname}.install
md5sums=('23ec5900abd2b9f9196cec94ae505315')

package() {
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ 2\ AM.ttf      ${pkgdir}/usr/share/fonts/TTF/Blackout2AM.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ Midnight.ttf   ${pkgdir}/usr/share/fonts/TTF/BlackoutMidnight.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ Sunrise.ttf    ${pkgdir}/usr/share/fonts/TTF/BlackoutSunrise.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ Two\ AM.ttf    ${pkgdir}/usr/share/fonts/TTF/BlackoutTwoAM.ttf

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

