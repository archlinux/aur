# Maintainer: Max Wölfing <ff0x@infr.cat>
pkgname=netctl-mm
pkgver=0.0.11
pkgrel=1
pkgdesc="Mobile broadband support for netctl using ModemManager"
arch=(any)
license=('GPL')
depends=(netctl modemmanager)
source=(mobile_mm.profile mobile_mm)
md5sums=('03d3c43f41396093c64348c89c9c6342'
         '0f19810092c4600a13ea0aa5c5994658')

package() {
  install -Dm644 "$srcdir/mobile_mm.profile" "$pkgdir/etc/netctl/examples/mobile_mm"
  install -Dm644 "$srcdir/mobile_mm" "$pkgdir/usr/lib/netctl/connections/mobile_mm"
}
