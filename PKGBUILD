# Maintainer: Sakari <sk308269317@outlook.com>

pkgname=uuplugin-bin
pkgver=4.7.16
pkgrel=1
pkgdesc="UU Steam Deck Plugin for General Linux"
arch=('x86_64')
url="https://uu.163.com/"
license=('custom')
source=(
  "https://uu.gdl.netease.com/uuplugin/steam-deck-plugin-x86_64/v${pkgver}/uu.tar.gz"
  'uuplugin.service')
md5sums=(
  '68835a60496d4c8fa1a27c0d155b39a3'
  '5e2b2721fb74d674325ebedaff3253b1')

package() {

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/etc/uuplugin"
  install -Dm755 "${srcdir}/uuplugin" "${pkgdir}/usr/bin/uuplugin"
  install -Dm644 "${srcdir}/uu.conf" "${pkgdir}/etc/uuplugin/uu.conf"
  install -Dm644 "${srcdir}/uuplugin.service" "${pkgdir}/usr/lib/systemd/system/uuplugin.service"

}
