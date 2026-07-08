# Maintainer: creations
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.2.6
pkgrel=1
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
install=equicord-installer-bin.install
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.2.6/EquilotlCli-linux")
sha256sums=('5179bff47736c9d0e2df8367798d7c743d221c403f6c9262f8571f34d3383ed1')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/equicord-installer"
    ln -s equicord-installer "${pkgdir}/usr/bin/Equilotl"
    ln -s equicord-installer "${pkgdir}/usr/bin/equilotl"
}
