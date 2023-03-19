# Maintainer: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.2.6
pkgrel=1
pkgdesc='A GUI app for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("VencordInstaller::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstaller-x11")
sha256sums=('b6752fb31edeab46f33c4e9277920e37d6541585d86865a8d3a010d7276b583a')

package() {
    install -Dm755 VencordInstaller "${pkgdir}/usr/bin/VencordInstaller"
}
