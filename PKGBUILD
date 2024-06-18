# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=retrovirtualmachine
pkgver=2.1.15
pkgrel=1
pkgdesc="Emulator for ZX Spectrum (including Pentagon and TK models), Amstrad CPC (including Plus models), MSX-1, Colecovision SEGA SG-1000 and Sega Master System machines"
url="https://www.retrovirtualmachine.org"
arch=('x86_64')
license=('custom:unknown')
depends=('libxinerama'
         'libxi'
         'hicolor-icon-theme'
         'libglvnd')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://static.retrovm.org/release/$pkgver/RetroVirtualMachine.${pkgver}.Linux.x64.deb")
sha256sums=('869b4f096b320f5288850ab2c052eb6215e33268f2815e3889227546e6ca84db')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  chown root:root -R "${pkgdir}/"
}
