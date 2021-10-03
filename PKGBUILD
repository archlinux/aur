# Maintainer: Max Bülte <ff0x@this-is-fine.io>
pkgname=netctl-mm
pkgver=0.1.3
pkgrel=1
pkgdesc="Mobile broadband support for netctl using ModemManager"
arch=(any)
license=('GPL')
depends=(netctl modemmanager jq)
source=(mobile_mm.profile mobile_mm)
md5sums=('9ef0982f28ef7e14dd9e458890234e85'
         '4b542c4946e5adffcfe4b1602b3a8d50')

package() {
  install -Dm644 "$srcdir/mobile_mm.profile" "$pkgdir/etc/netctl/examples/mobile_mm"
  install -Dm644 "$srcdir/mobile_mm" "$pkgdir/usr/lib/netctl/connections/mobile_mm"
}
