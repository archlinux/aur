# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=junction
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="Junction is a a humanist sans-serif, and the first open-source type project started by The League of Moveable Type."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('otf-junction')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('e35636a6a9075db4f1bc09df69b8d0d3')

package() {
  install -Dm644 ${srcdir}/${_fnt_name}-master/Junction-bold.otf    ${pkgdir}/usr/share/fonts/OTF/JunctionBold.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Junction-light.otf   ${pkgdir}/usr/share/fonts/OTF/JunctionLight.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/Junction-regular.otf ${pkgdir}/usr/share/fonts/OTF/JunctionRegular.otf

  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/junction-bold.ttf    ${pkgdir}/usr/share/fonts/TTF/JunctionBold.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/junction-light.ttf   ${pkgdir}/usr/share/fonts/TTF/JunctionLight.ttf
  install -Dm644 ${srcdir}/${_fnt_name}-master/webfonts/junction-regular.ttf ${pkgdir}/usr/share/fonts/TTF/JunctionRegular.ttf

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
