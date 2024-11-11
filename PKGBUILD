# Maintainer: Cortex
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.0.7
pkgrel=1
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.0.7/EquilotlCli-linux")
sha256sums=('c16cbb36425d6d655c2b43d2973871c7715bfe90ef7155bd155434068cc16be4')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/Equilotl"
}
