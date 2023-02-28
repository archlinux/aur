# Maintainer: Jade Herd <toxicaven@disroot.org>
pkgname=vencord-installer-bin
_pkgname=Installer
pkgver=1.2.5
pkgrel=1
pkgdesc='A GUI app for installing Vencord'
license=('GPL3')
arch=('x86_64')
url="https://github.com/Vencord/Installer"
source=("VencordInstaller::https://github.com/Vencord/Installer/releases/download/v${pkgver}/VencordInstaller-x11")
sha256sums=('2df1a1bbd97dd4a8383445c9410506f0692bccea4c49cdf941a76f7e27933feb')

package() {
    install -Dm755 VencordInstaller "${pkgdir}/usr/bin/VencordInstaller"
}
