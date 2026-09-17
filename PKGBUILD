# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.4.1
pkgrel=1
pkgdesc='A CLI tool for installing Vencord'
license=('GPL-3.0-only')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("VencordInstaller-${pkgver}::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstallerCli-linux")
sha256sums=('530e069c1d19972587e4ca26fc85c414bfa6b100b6f6c9b7a0d2339d69ec58a8')

package() {
    install -Dm755 VencordInstaller-${pkgver} "${pkgdir}/usr/bin/vencordinstaller"
}

