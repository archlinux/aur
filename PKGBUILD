# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-mmcedar
pkgver=20101113a
pkgrel=7
pkgdesc="A combined font that uses Motoya L Cedar and M+ fonts"
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom' 'Apache')
arch=('any')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://osdn.net/users/utuhiro/pf/utuhiro/dl/mmcedar-${pkgver}.tar.lzma)
md5sums=('04b31f5fecde115a2d253eaa56be019b')
b2sums=('d0ea33afe8caeb681f9bcf633d039bcf827d3df0d413518a512891c22613fab2fba345062bcfd3aa4052ecb484bf4422c32019e0400b96f21f109c876206106e')

package() {
  cd ${srcdir}/mmcedar-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 doc-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
}
