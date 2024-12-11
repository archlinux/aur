# Maintainer: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.4.0
pkgrel=1
pkgdesc='A CLI tool for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("VencordInstaller::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstallerCli-linux")
sha256sums=('a2c888f4e18445c6eb94c94f40d0b30937ffe22aeaeb2e9505382e9830f4acc8')

package() {
    install -Dm755 VencordInstaller "${pkgdir}/usr/bin/VencordInstaller"
}

