# Maintainer: creations
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.1.4
pkgrel=1
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
install=equicord-installer-bin.install
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.1.4/EquilotlCli-linux")
sha256sums=('6ed99c5a83cf2ade19908ce4dae79178893c5690e3e07cb95102d5ff0a74daee')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/equicord-installer"
    ln -s equicord-installer "${pkgdir}/usr/bin/Equilotl"
    ln -s equicord-installer "${pkgdir}/usr/bin/equilotl"
}
