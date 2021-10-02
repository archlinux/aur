# Maintainer: Max Bülte <ff0x@this-is-fine.io>
pkgname=netctl-mm
pkgver=0.1.1
pkgrel=1
pkgdesc="Mobile broadband support for netctl using ModemManager"
arch=(any)
license=('GPL')
depends=(netctl modemmanager jq)
source=(mobile_mm.profile mobile_mm)
md5sums=('ccd14753d61a5439ebf4ee01d500b5c8'
         'e90c30ee7b5e08408515099341779d19')

package() {
  install -Dm644 "$srcdir/mobile_mm.profile" "$pkgdir/etc/netctl/examples/mobile_mm"
  install -Dm644 "$srcdir/mobile_mm" "$pkgdir/usr/lib/netctl/connections/mobile_mm"
}
