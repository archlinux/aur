# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=retrovirtualmachine
pkgver=2.1.4
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
sha256sums=('598c108c929804c56dcd55275b5f8db711fd702493ad1cfadf68791335745746')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  chown root:root -R "${pkgdir}/"
}
