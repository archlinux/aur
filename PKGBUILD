# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=raleway
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="An elegant sans-serif font, designed in a single thin weight."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('otf-raleway')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('147dff2149b4d910023e459de8b260bb')

package() {
  install -Dm644 ${srcdir}/${_fnt_name}-master/Raleway\ Thin.otf    ${pkgdir}/usr/share/fonts/OTF/RalewayThin.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Raleway\ Thin.ttf    ${pkgdir}/usr/share/fonts/TTF/RalewayThin.ttf

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
