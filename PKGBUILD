# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=yuranpad
pkgver=2.4
pkgrel=1
pkgdesc='A free text editor for Windows and Linux'
arch=('x86_64')
url='https://yuranpad.sourceforge.io'
license=('custom')
depends=('gtk2')
source=("${pkgname}-${pkgver}.deb::https://sourceforge.net/projects/yuranpad/files/yuranpad_${pkgver}_x86_64.deb/download")
sha256sums=('9c785a8d961a07816fde98adcae0cb2b68d510eaf9903d82a2a17c8171b3f6af')
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/YuranPad/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
