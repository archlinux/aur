# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=persian-hm-ftx-fonts
pkgver=3.5
pkgrel=2
pkgdesc="A Persian font series derived from X Series 2, Metafont and FarsiTeX fonts with Kashida feature."
url="https://bitbucket.org/dma8hm1334"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=('ttf-persian-hm-ftx')
conflicts=('ttf-persian-hm-ftx')
source=("${url}/persian-hm-ftx-${pkgver}/downloads/persian-hm-ftx-${pkgver}.7z")
sha256sums=('fce22d6bb98075bdb295f2547907010fff961d9f9e06096fe371d73f0103f581')

package() {
  cd $srcdir/${pkgname%-fonts}-$pkgver
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
