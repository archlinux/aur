# Maintainer: Max Wölfing <ff0x@infr.cat>
pkgname=netctl-mm
pkgver=0.0.9
pkgrel=1
pkgdesc="Mobile broadband support for netctl using ModemManager"
arch=(any)
license=('GPL')
depends=(netctl modemmanager)
source=(mobile_mm.profile mobile_mm)
md5sums=('7b317a1f78ad63bfb8fb4973309883f5'
         '9d3bcdaba9096d840bde6f4014bf175e')

package() {
  install -Dm644 "$srcdir/mobile_mm.profile" "$pkgdir/etc/netctl/examples/mobile_mm"
  install -Dm644 "$srcdir/mobile_mm" "$pkgdir/usr/lib/netctl/connections/mobile_mm"
}
