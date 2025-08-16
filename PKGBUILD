# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=persian-hm-xs2-fonts
pkgver=3.9
pkgrel=2
pkgdesc="A Persian font series derived from X Series 2 fonts with Kashida feature."
url="https://bitbucket.org/dma8hm1334"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=("ttf-${pkgname%-fonts}")
conflicts=("ttf-${pkgname%-fonts}")
source=("${pkgname}-${pkgver}.zip::${url}/persian-hm-xs2-${pkgver}/get/master.zip")
sha256sums=('83a4c27b2015256b6663960ceeaf5bfaf7f93244f2f8749b35c55de9a78ec3a3')

package() {
  cd ${srcdir}/dma8hm1334-persian-hm-xs2-3.9-8e638770251e/${pkgname%-fonts}-${pkgver}/
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
