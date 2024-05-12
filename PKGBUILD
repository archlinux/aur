# Maintainer: Cortex
pkgname=suncord-installer-bin
_pkgname=Installer
pkgver=$(curl -s https://api.github.com/repos/verticalsync/SuncordInstaller/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
pkgrel=1
pkgdesc='CLI Installer for Suncord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/verticalsync/SuncordInstaller"
source=("SuncordInstaller::https://github.com/verticalsync/SuncordInstaller/releases/download/${pkgver}/SuncordInstallerCli-linux")
sha256sums=('SKIP')

package() {
    install -Dm755 SuncordInstaller "${pkgdir}/usr/bin/SuncordInstaller"
}