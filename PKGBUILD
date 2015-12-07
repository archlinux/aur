# Maintainer: AJ <aj at hckr dot eml dot cc>
# Maintainer: Adam Kürthy  <adikurthy at gmail dot com>
# Maintainer: Michael Bentlage <Mi.Bentlage at gmail dot com>
pkgname=systemd-vgaswitcheroo-units
pkgver=1.2
pkgrel=2
pkgdesc="Disable discrete GPU at boot for AMD/NVIDIA & Intel dual stuff"
arch=('any')
# Based on https://github.com/fredoche/vgaswitcheroo_systemd
url="https://github.com/astrohckr/systemd-vgaswitcheroo-units"
license=('GPL')
depends=('systemd')
install=systemd-vgaswitcheroo-units.install
source=('vgaswitcheroo.service'
	'vgaswitcheroo_start.sh'
	'vgaswitcheroo_stop.sh')
package() {
  install -Dm644 "${srcdir}/vgaswitcheroo.service" "${pkgdir}/usr/lib/systemd/system/vgaswitcheroo.service"
  install -Dm755 "${srcdir}/vgaswitcheroo_start.sh" "${pkgdir}/usr/bin/vgaswitcheroo_start.sh"
  install -Dm755 "${srcdir}/vgaswitcheroo_stop.sh" "${pkgdir}/usr/bin/vgaswitcheroo_stop.sh"
}


md5sums=('a01b63dacaa632b03cd2bfe1832f4d31'
         '4919673009c0a5c54322a1a9624801e9'
         'bb23032dab1bc88369d77ef94d4b9642')
