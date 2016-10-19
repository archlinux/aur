# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-monapo
pkgver=20090423
pkgrel=6
pkgdesc="A Japanese font for viewing Japanese ascii arts properly"
arch=('any')
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist"
source=(http://${_mirror}.dl.osdn.jp/users/11/11147/monapo-${pkgver}.tar.bz2)
sha256sums=('acd472be301885dd7513d5b770d8db3b4f5e9425c0bfe9fd914cef1a4a16489f')

package() {
  cd ${srcdir}/monapo-${pkgver}

  install -D -m644 monapo.ttf ${pkgdir}/usr/share/fonts/TTF/monapo.ttf

  install -D -m644 IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
