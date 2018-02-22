# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=linden-hill
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="A digital version of Frederic Goudy’s font Deepdene."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('7803c1e2b05f607320535042e976ab11')

package() {
  install -Dm644 ${srcdir}/${_fnt_name}-master/Linden\ Hill.otf                        ${pkgdir}/usr/share/fonts/OTF/LindenHill.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Linden\ Hill\ Italic.otf                ${pkgdir}/usr/share/fonts/OTF/LindenHillItalic.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/LindenHill-webfont.ttf         ${pkgdir}/usr/share/fonts/TTF/LindenHill.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/LindenHill-Italic-webfont.ttf  ${pkgdir}/usr/share/fonts/TTF/LindenHillItalic.ttf

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
