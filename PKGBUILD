# Maintainer: creations
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.4.1
pkgrel=1
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
install=equicord-installer-bin.install
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.4.1/EquilotlCli-linux")
sha256sums=('a0f18938abb38dfc39161c330dd331cd1fbf972c36993e44d6f0a28d5204f12c')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/equicord-installer"
    ln -s equicord-installer "${pkgdir}/usr/bin/Equilotl"
    ln -s equicord-installer "${pkgdir}/usr/bin/equilotl"
}
