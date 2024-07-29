# Maintainer: Cortex
pkgname=equicord-installer-bin
_pkgname=EquicordInstaller
pkgver=1.0.4
pkgrel=1
pkgdesc='CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/verticalsync/SuncordInstaller"
source=("EquicordInstaller::https://github.com/Equicord/Equilotl/releases/download/v2.0.5/EquilotlCli-linux")
sha256sums=('SKIP')

package() {
    install -Dm755 EquicordInstaller "${pkgdir}/usr/bin/EquicordInstaller"
}
