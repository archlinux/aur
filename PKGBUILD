# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=persian-hm-xs2-fonts
pkgver=3.8
pkgrel=1
pkgdesc="A Persian font series derived from X Series 2 fonts with Kashida feature."
url="https://bitbucket.org/dma8hm1334"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=('ttf-persian-hm-xs2')
conflicts=('ttf-persian-hm-xs2')
source=("$pkgname-$pkgver.zip::${url}/persian-hm-xs2-${pkgver}/get/master.zip")
sha256sums=('51330a777dc4923534f995dd9866963214c21e80155cd28e475afa8a77d72901')

package() {
  cd $srcdir/dma8hm1334-persian-hm-xs2-3.8-cef6183669b4/${pkgname%-fonts}-$pkgver/
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
