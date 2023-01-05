# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-vlgothic
pkgver=20220612
pkgrel=1
pkgdesc="Japanese TrueType fonts from Vine Linux"
arch=('any')
url="http://vlgothic.dicey.org/"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale')
source=(https://osdn.net/dl/vlgothic/VLGothic-${pkgver}.tar.xz)
md5sums=('99dc972cbd15f65b8209bb344fa4b687')
b2sums=('ba11ee428c2398caa814551e401685f53c29653b6093aff339fef67887f33069b5a8033d1ae3a362fef3c4ee6f19a359ac6ab5a48b8f4e057ceeee11921ad2fb')

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
