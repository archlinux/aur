# Maintainer: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.3.0
pkgrel=1
pkgdesc='A GUI app for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("VencordInstaller::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstaller-x11")
sha256sums=('918b605ed01e530e9f65fd8e99af4e4e617060aafec19985abc85414c1671456')

package() {
    install -Dm755 VencordInstaller "${pkgdir}/usr/bin/VencordInstaller"
}
