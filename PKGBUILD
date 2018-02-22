# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=blackout
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=3
pkgdesc="Eats holes for breakfast lunch and dinner. Inspired by filling in sans-serif newspaper headlines. Continually updated with coffee and music. Makes your work louder than the next person’s."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('23ec5900abd2b9f9196cec94ae505315')

package() {
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ 2\ AM.ttf      ${pkgdir}/usr/share/fonts/TTF/Blackout2AM.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ Midnight.ttf   ${pkgdir}/usr/share/fonts/TTF/BlackoutMidnight.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ Sunrise.ttf    ${pkgdir}/usr/share/fonts/TTF/BlackoutSunrise.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Blackout\ Two\ AM.ttf    ${pkgdir}/usr/share/fonts/TTF/BlackoutTwoAM.ttf

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

