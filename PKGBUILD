# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-komatuna
pkgver=20101113
pkgrel=6
pkgdesc="Modified Konatu and M+ fonts for Japanese"
arch=('any')
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom' 'CCPL')
depends=('fontconfig')
source=(http://jaist.dl.osdn.jp/users/8/8846/komatuna-fonts-${pkgver}.tar.lzma)
sha256sums=('969de6b8bb3b9893356d19c09d646f0f5364247ab98b9a437e049ca2ac8241a3')

package() {
  cd ${srcdir}/komatuna-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
}
