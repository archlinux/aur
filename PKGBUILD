# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vvctre-bin
pkgver=30.3.0
pkgrel=1
pkgdesc='A Nintendo 3DS emulator based on Citra'
arch=('x86_64')
url='https://gbatemp.net/threads/vvctre-nintendo-3ds-emulator-based-on-citra.560052'
license=('GPL-2.0')
provides=('vvctre')
source=("${pkgname}-${pkgver}.7z::https://github.com/vvanelslande/vvctre/releases/download/${pkgver}/vvctre-${pkgver}-Linux.7z")
sha256sums=('9272d0bc6687f0ce3e89f4e8f8a26a978804c5313d2265debf652e9632bd5aa5')

package() {
  install -Dm755 "${srcdir}/vvctre" -t "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
  ln -s /usr/share/licenses/common/GPL2/license.txt \
   "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
# vim:set ts=2 sw=2 et: