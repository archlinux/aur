# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.4.0
pkgrel=2
pkgdesc='A CLI tool for installing Vencord'
license=('GPL-3.0-only')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("VencordInstaller-${pkgver}::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstallerCli-linux")
sha256sums=('265c2f9ed208dc71150fdc08bd2ab6cf1a02be3bf51f4395417888029da6e753')

package() {
    install -Dm755 VencordInstaller-${pkgver} "${pkgdir}/usr/bin/VencordInstaller"
}

