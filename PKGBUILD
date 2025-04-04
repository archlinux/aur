# Maintainer: Cortex
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.0.9.2
pkgrel=2
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.0.9.2/EquilotlCli-linux")
sha256sums=('skip')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/Equilotl"
}
