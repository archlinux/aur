# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-vlgothic
pkgver=20200720
pkgrel=1
pkgdesc="Japanese TrueType fonts from Vine Linux"
arch=('any')
url="http://vlgothic.dicey.org/"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://osdn.net/dl/vlgothic/VLGothic-${pkgver}.tar.xz)
md5sums=('50cb22613133aa7e0a2591bbf67d25ed')
b2sums=('97910117cb9d6b22a9711b132c77c403b242465d40afb2812aa1792c26527c30d1c00f7d2f9c379efe648cc6fb0b2adda351483a0508c88548cdce0e313c51f2')

package() {
  cd ${srcdir}/VLGothic

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 LICENSE_E.mplus \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
  install -D -m644 README.sazanami \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_SAZANAMI.txt
  install -D -m644 LICENSE.en \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_VLGOTHIC.txt
}
