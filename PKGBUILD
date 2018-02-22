# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=league-gothic
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="League Gothic is a revival of an old classic, and one of our favorite typefaces, Alternate Gothic #1"
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('otf-league-gothic')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('e19525cac31d325b4604d01e36c9fd6c')

package() {
  install -Dm644 ${srcdir}/${_fnt_name}-master/LeagueGothic-CondensedItalic.otf   ${pkgdir}/usr/share/fonts/OTF/LeagueGothic-CondensedItalic.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/LeagueGothic-CondensedRegular.otf  ${pkgdir}/usr/share/fonts/OTF/LeagueGothic-CondensedRegular.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/LeagueGothic-Italic.otf            ${pkgdir}/usr/share/fonts/OTF/LeagueGothic-Italic.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/LeagueGothic-Regular.otf           ${pkgdir}/usr/share/fonts/OTF/LeagueGothic-Regular.otf

  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/leaguegothic-condensed-italic-webfont.ttf   ${pkgdir}/usr/share/fonts/TTF/LeagueGothic-CondensedItalic.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/leaguegothic-condensed-regular-webfont.ttf  ${pkgdir}/usr/share/fonts/TTF/LeagueGothic-CondensedRegular.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/leaguegothic-italic-webfont.ttf             ${pkgdir}/usr/share/fonts/TTF/LeagueGothic-Italic.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/leaguegothic-regular-webfont.ttf            ${pkgdir}/usr/share/fonts/TTF/LeagueGothic-Regular.ttf

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
