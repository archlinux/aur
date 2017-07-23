# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-monapo
pkgver=20170722
pkgrel=1
pkgdesc="A Japanese font for viewing Japanese ascii arts properly"
arch=('any')
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
depends=('fontconfig')
install=ttf.install
_mirror="jaist"
source=(http://${_mirror}.dl.osdn.jp/users/13/13586/monapo-${pkgver}.tar.bz2)
sha256sums=('44ef5159ae67f0933f982057227f88973f470ce8452915b410abe99ef7b43d22')

package() {
  cd ${srcdir}/monapo-${pkgver}

  install -D -m644 monapo.ttf ${pkgdir}/usr/share/fonts/TTF/monapo.ttf

  install -D -m644 ipagp00303/IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
