# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.4.2
pkgrel=1
pkgdesc='A CLI tool for installing Vencord'
license=('GPL-3.0-only')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("VencordInstaller-${pkgver}::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstallerCli-linux")
sha256sums=('52642c8521a866ad241c10337144a4f513672c54b9c86a8169954785054c815d')

package() {
    install -Dm755 VencordInstaller-${pkgver} "${pkgdir}/usr/bin/vencordinstaller"
}

