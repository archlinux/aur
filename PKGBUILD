# Maintainer: Max Wölfing <ff0x@infr.cat>
pkgname=netctl-mm
pkgver=0.0.6
pkgrel=1
pkgdesc="Mobile broadband support for netctl using ModemManager"
arch=(any)
license=('GPL')
depends=(netctl modemmanager)
source=(mobile_mm.profile mobile_mm)
md5sums=('ccad269de8f7c0d0cb89d3112849023d'
         '67b54403ec1f95330ffc11c35fb722c3')

package() {
  install -Dm644 "$srcdir/mobile_mm.profile" "$pkgdir/etc/netctl/examples/mobile_mm"
  install -Dm644 "$srcdir/mobile_mm" "$pkgdir/usr/lib/netctl/connections/mobile_mm"
}
