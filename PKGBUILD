# Maintainer: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.2.10
pkgrel=1
pkgdesc='A GUI app for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("VencordInstaller::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstaller-x11")
sha256sums=('dda5f8436b489161b3a77c7f82ad8708d4c2c9c1f57a321ce3626b0680e9981b')

package() {
    install -Dm755 VencordInstaller "${pkgdir}/usr/bin/VencordInstaller"
}
