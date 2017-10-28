# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=persian-hm-xs2-fonts
pkgver=3.3
pkgrel=1
pkgdesc="A Persian font series derived from X Series 2 fonts with Kashida feature."
url="https://bitbucket.org/dma8hm1334"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=('ttf-persian-hm-xs2')
conflicts=('ttf-persian-hm-xs2')
source=("${url}/persian-hm-xs2-${pkgver}/downloads/persian-hm-xs2-${pkgver}.7z")
sha256sums=('9524ef927064386cd765b39f9c4ba3edb5831c4a651bec550ff0a879a99b49a1')

package() {
  cd $srcdir/${pkgname%-fonts}-$pkgver
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
