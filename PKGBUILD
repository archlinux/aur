# Maintainer: Max Wölfing <ff0x@infr.cat>
pkgname=netctl-mm
pkgver=0.0.7
pkgrel=1
pkgdesc="Mobile broadband support for netctl using ModemManager"
arch=(any)
license=('GPL')
depends=(netctl modemmanager)
source=(mobile_mm.profile mobile_mm)
md5sums=('ccad269de8f7c0d0cb89d3112849023d'
         '340792cd0b9f6f7452bbd96ca45a41a4')

package() {
  install -Dm644 "$srcdir/mobile_mm.profile" "$pkgdir/etc/netctl/examples/mobile_mm"
  install -Dm644 "$srcdir/mobile_mm" "$pkgdir/usr/lib/netctl/connections/mobile_mm"
}
