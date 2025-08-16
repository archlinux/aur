# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Misano <me@mirsobhan.ir>
pkgname=persian-hm-ftx-fonts
pkgver=3.9
pkgrel=2
pkgdesc="A Persian font series derived from X Series 2, Metafont and FarsiTeX fonts with Kashida feature."
url="https://bitbucket.org/dma8hm1334"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=("ttf-${pkgname%-fonts}")
conflicts=("ttf-${pkgname%-fonts}")
source=("${pkgname}-${pkgver}.zip"::"${url}/persian-hm-ftx-${pkgver}/get/master.zip")
sha256sums=('1028a9cdd6478291ab5591210db2e59044cfc7ad9613c2bd4f315b36299a99a2')

package() {
  cd ${srcdir}/dma8hm1334-persian-hm-ftx-3.9-832f90f12a16/${pkgname%-fonts}-${pkgver}
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
