# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-komatuna
pkgver=20101113
pkgrel=7
pkgdesc="Modified Konatu and M+ fonts for Japanese"
arch=('any')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom' 'CCPL:by-sa')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://osdn.net/users/utuhiro/pf/utuhiro/dl/komatuna-fonts-${pkgver}.tar.lzma)
md5sums=('2044e5e036b1e6dab2f8426c6e2894e6')
b2sums=('7a96e4004530748cec78c20af48bf28dabf322e38657adbe92975f8a082c74ad8e58afddb089f63684e40e6f18380ea0110b0718fadb96f707bc50aae73c8536')

package() {
  cd ${srcdir}/komatuna-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
}
