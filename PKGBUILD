# Maintainer: Dmitriy Q 

pkgname=network-management-client-bin
pkgver=0.3.1
pkgrel=3
pkgdesc="A desktop client for using and managing Meshtastic devices."
arch=("x86_64")
url="https://github.com/meshtastic/network-management-client"
license=("GPLv3")
categories=("network")

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("https://github.com/meshtastic/${pkgname%-bin}/releases/download/v${pkgver}/Meshtastic.Network.Management.Client_${pkgver}_amd64.deb")
sha256sums=('c99be350fb34651d19d2fc5fe085a0e2403b5581417a46aaffe07a84435e2ed0')

package(){
    bsdtar xzf data.tar.gz -C "${srcdir}"
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
