# Maintainer: creations
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.2.2
pkgrel=1
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
install=equicord-installer-bin.install
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.2.2/EquilotlCli-linux")
sha256sums=('c066ec44fcfcee00ce1ebcd36eed777fdb5cf402e6670a2a7c09f01d38d30a51')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/equicord-installer"
    ln -s equicord-installer "${pkgdir}/usr/bin/Equilotl"
    ln -s equicord-installer "${pkgdir}/usr/bin/equilotl"
}
