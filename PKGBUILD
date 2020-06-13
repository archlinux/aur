# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=persian-hm-ftx-fonts
pkgver=3.8
pkgrel=1
pkgdesc="A Persian font series derived from X Series 2, Metafont and FarsiTeX fonts with Kashida feature."
url="https://bitbucket.org/dma8hm1334"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=('ttf-persian-hm-ftx')
conflicts=('ttf-persian-hm-ftx')
source=("$pkgname-$pkgver.tar.gz"::"${url}/persian-hm-ftx-${pkgver}/get/master.tar.gz")
sha256sums=('9b4863c1413edff3ab136dadda227feb2fe709109673249a799bcf6cad87c448')

package() {
  cd $srcdir/dma8hm1334-persian-hm-ftx-3.8-b18e150ebc1d/${pkgname%-fonts}-$pkgver
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
