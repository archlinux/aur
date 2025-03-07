# Maintainer: Cortex
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.0.9.2
pkgrel=1
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.0.9.2/EquilotlCli-linux")
sha256sums=('28772426e22e810c4f9b84c2a6b29013e1cd49f10dc04fc34ab1121259616684')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/Equilotl"
}
