# Maintainer: Cortex
pkgname=suncord-installer-bin
_pkgname=Installer
pkgver=1.0.4
pkgrel=1
pkgdesc='CLI Installer for Suncord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/verticalsync/SuncordInstaller"
source=("SuncordInstaller::https://github.com/verticalsync/SuncordInstaller/releases/latest/download/SuncordInstallerCli-Linux")
sha256sums=('SKIP')

package() {
    install -Dm755 SuncordInstaller "${pkgdir}/usr/bin/SuncordInstaller"
}