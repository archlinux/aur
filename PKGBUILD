# Maintainer: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.2.7
pkgrel=1
pkgdesc='A GUI app for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("VencordInstaller::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstaller-x11")
sha256sums=('b39f5f0ce28b171ef729ad20f6dfcaea8c2d927cf0a6c5c2681c0ac307bd7aa0')

package() {
    install -Dm755 VencordInstaller "${pkgdir}/usr/bin/VencordInstaller"
}
