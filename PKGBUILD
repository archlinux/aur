# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.4.0
pkgrel=3
pkgdesc='A CLI tool for installing Vencord'
license=('GPL-3.0-only')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("VencordInstaller-${pkgver}::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstallerCli-linux")
sha256sums=('815917a79391a4426022b395cc1d8e41ae80130edab98cbfbe08fbbe67cd2b28')

package() {
    install -Dm755 VencordInstaller-${pkgver} "${pkgdir}/usr/bin/VencordInstaller"
}

