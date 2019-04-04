# Maintainer: Antonio Orefice <kokoko3k@gmail.com>

pkgname=net-names-crc16
pkgver=1.0
pkgrel=1
pkgdesc='Udev rule and helper script to rename interfaces using a crc16 calculation based on the mac address'
arch=('any')
url="http://reactivated.net/writing_udev_rules.html"
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'udev')
source=(10-net-names-crc16.rules crc16.sh)

sha256sums=('faa5a892965bcc25b161dc2942c5e1ad47eaebd1d779f3bbfd4cea67af48ec9a'
            '1760f03a70d16f0de9187e930aa1143f0de1425bb8cb53f90973f0f12bbe94a8')

package() {
  install -Dm644 10-net-names-crc16.rules ${pkgdir}/etc/udev/rules.d/10-net-names-crc16.rules
  install -Dm755 crc16.sh ${pkgdir}/usr/bin/crc16.sh
}

install=${pkgname}.install

