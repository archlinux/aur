# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=chunk
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="An ultra-bold slab serif typeface that is reminiscent of old American Western woodcuts, broadsides, and newspaper headlines. Used mainly for display, the fat block lettering is unreserved yet refined for contemporary use."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('96287d88f72c475a3006031b80dcdc5e')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/${_fnt_name}-master/*.ttf  ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}

