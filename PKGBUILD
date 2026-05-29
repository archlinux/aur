# Maintainer: creations
pkgname=equicord-installer-bin
_pkgname=equilotlcli
pkgver=2.2.3
pkgrel=1
pkgdesc='Equilotl is the CLI Installer for Equicord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Equicord/Equilotl"
install=equicord-installer-bin.install
source=("Equilotl::https://github.com/Equicord/Equilotl/releases/download/v2.2.3/EquilotlCli-linux")
sha256sums=('424ff2ff252628fe89bc736098af21f1ce5e9ce5666e4f1ae535a1906867bd53')

package() {
    install -Dm755 Equilotl "${pkgdir}/usr/bin/equicord-installer"
    ln -s equicord-installer "${pkgdir}/usr/bin/Equilotl"
    ln -s equicord-installer "${pkgdir}/usr/bin/equilotl"
}
