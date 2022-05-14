# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15composer-systemd
pkgver=20211101
pkgrel=1
pkgdesc="g15composer init script for systemd"
arch=('any')
url="https://gitlab.com/menelkir/g15composer"
license=('GPL2')
depends=('g15composer' 'g15daemon-systemd')
_filename='g15composer.service'
source=("https://gitlab.com/menelkir/g15composer/-/raw/master/contrib/init/g15composer.service")
sha256sums=('243bfc145afc43241dcc042a7f79c9a542aff596d12e1b3d87fb04ae18b25c6b')

package() {
  install -D -m 644 "g15composer.service" "${pkgdir}/usr/lib/systemd/system/g15composer.service"
}
