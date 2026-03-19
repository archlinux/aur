# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Minecraft P2P multiplayer tunnel CLI"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-cli' 'sckc')
conflicts=('sculk-cli-git')
source=("sckc-${pkgver}::${url}/releases/download/v${pkgver}/sckc-linux-amd64")
sha256sums=('471fde64aea842fe1baad09bbc85f1051375d54f8159825a7a3e0bc4e68f8df1')

package() {
    install -Dm755 "${srcdir}/sckc-${pkgver}" "${pkgdir}/usr/bin/sckc"
}
