# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-monapo
pkgver=20170722
pkgrel=2
pkgdesc="A Japanese font for viewing Japanese ascii arts properly"
arch=('any')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://osdn.net/users/utuhiro/pf/utuhiro/dl/monapo-${pkgver}.tar.bz2)
md5sums=('f6bdac3e091923b6d726c4d0844ad110')
b2sums=('1fcb1b0599e9268aa6e004bcf645be997adc340bfe4e192064354e64d830f7d231aa5919ff839dac4ca2f7f1e43a9e85e9aa43ea0153d47d59d658cecce2330e')

package() {
  cd ${srcdir}/monapo-${pkgver}

  install -D -m644 monapo.ttf ${pkgdir}/usr/share/fonts/TTF/monapo.ttf

  install -D -m644 ipagp00303/IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
