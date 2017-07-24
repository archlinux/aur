# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-vlgothic
pkgver=20141206
pkgrel=2
pkgdesc="Japanese TrueType fonts from Vine Linux"
arch=('any')
url="http://vlgothic.dicey.org/"
license=('custom')
depends=('fontconfig')
_mirror="jaist"
source=(http://${_mirror}.dl.osdn.jp/vlgothic/62375/VLGothic-${pkgver}.tar.xz)
sha256sums=('982040db2f9cb73d7c6ab7d9d163f2ed46d1180f330c9ba2fae303649bf8102d')

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
