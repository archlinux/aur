# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bluetooth-unlock
pkgver=BU.V1FR1
_pkgver=BU-V1FR1
pkgrel=1
pkgdesc='Simple script to unlock your Linux based Computer using a Bluetooth device when nearby'
arch=('any')
url='https://github.com/LethalEthan/Bluetooth-Unlock'
license=('MIT')
depends=('python'
         'python-pybluez'
         'tar'
         'bluez-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LethalEthan/Bluetooth-Unlock/archive/${_pkgver}.tar.gz")
sha256sums=('042f63e05deca785d92c04a161eadcca8f8a1bf01e5e4a9392dca3e1b0adbc25')

package() {
  cd "Bluetooth-Unlock-${_pkgver}"
  install -Dm755 Bluetooth-Unlock.py "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
