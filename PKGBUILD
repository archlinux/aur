# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=knewave
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc="A bold, painted face font for the rocker within."
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
md5sums=('ec880e36c11c0a16b06be6cd5884e3b8')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/${_fnt_name}-master/*.otf  ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/${_fnt_name}-master/*.ttf  ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/${_fnt_name}-master/Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
