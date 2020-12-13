# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=yuranpad
pkgver=2.2
pkgrel=1
pkgdesc='A free text editor for Windows and Linux'
arch=('x86_64')
url='https://yuranpad.sourceforge.io'
license=('custom')
depends=('gtk2')
source=("${pkgname}-${pkgver}.deb::https://sourceforge.net/projects/yuranpad/files/Linux/yuranpad_${pkgver}_x86_64.deb/download")
sha256sums=('dd5b8a4d4ed05b6c4e35edd1823b36642fd005a91972a0b8a8174292b9678ade')
package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/share/YuranPad/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
