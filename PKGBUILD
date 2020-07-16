# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bluetooth-unlock
pkgver=V1RC9
pkgrel=1
pkgdesc='Simple script to unlock your Linux based Computer using a Bluetooth device when nearby'
arch=('any')
url='https://github.com/LethalEthan/Bluetooth-Unlock'
license=('MIT')
depends=('python-pybluez'
         'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LethalEthan/Bluetooth-Unlock/archive/BU-${pkgver}.tar.gz")
sha256sums=('dbd86cfbc47ae77a8f1369902f893eea420f7ea69dc6a58c5a30f4d60489a568')

package() {
  cd "Bluetooth-Unlock-BU-${pkgver}"
  install -Dm755 Bluetooth-Unlock.py "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: