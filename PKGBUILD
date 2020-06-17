# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=retrovirtualmachine
pkgver=2.0.beta.1.r7
_pkgver=2.0.beta-1.r7
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
source=("${pkgname}-${pkgver}.deb::https://static.retrovm.org/release/beta1/linux/x64/RetroVirtualMachine.${_pkgver}.linux.x64.deb")
sha256sums=('9f90afe4dda04430cedeb7919e6e879bf9d86df9c1bfc6349102901d9ec0fbc0')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  chown root:root -R "${pkgdir}/"
}