# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=retrovirtualmachine
pkgver=2.1.1
#_pkgver=2.0.beta-1.r7
pkgrel=1
pkgdesc="Emulator of the Amstrad CPC and the ZX Spectrum home computers"
url="https://www.retrovirtualmachine.org"
arch=('x86_64')
license=('custom:unknown')
depends=('libxinerama'
         'systemd-libs'
         'libxi'
         'hicolor-icon-theme'
         'libglvnd')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://static.retrovm.org/release/$pkgver/RetroVirtualMachine.${pkgver}.Linux.x64.deb")
sha256sums=('0eae66491e1c3b75cffde5ff950328b9ed8ba731e772fc09dfe96de998af8e29')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  chown root:root -R "${pkgdir}/"
}
