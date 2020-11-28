# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=qradiolink-bin
pkgver=0.8.5.rc3
_pkgver=0.8.5-rc3
pkgrel=1
pkgdesc='Multimode SDR transceiver for GNU radio'
arch=('x86_64')
url="http://qradiolink.org"
license=('GPL3')
provides=('qradiolink')
depends=('qt5-multimedia'
         'protobuf')
source=("${pkgname}-${_pkgver}.deb::https://github.com/qradiolink/qradiolink/releases/download/${_pkgver}/qradiolink_${_pkgver}_amd64.deb")
sha256sums=('d7517db50cda8370ab365ad204286cce1d432fc80692bd12bde7fce03fb05ff7')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
