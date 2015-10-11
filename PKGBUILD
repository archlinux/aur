pkgname=modemmanager-openrc
pkgver=0.1
pkgrel=1
pkgdesc="Provides ModemManager openrc script"
arch=('any')
license=('GPL')
depends=('networkmanager-openrc')
source=(ModemManager)
sha256sums=('8af4e3dadd49a72f812b97e342d16da29b82a0223d6ff569ae4ddc1077010911')

build() {
  echo building ModemManager openrc script
}

package() {
  mkdir -p "${pkgdir}/etc/init.d"
  cp "${srcdir}/ModemManager" "${pkgdir}/etc/init.d/"
}

# vim:set ts=2 sw=2 et:
