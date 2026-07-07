# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-cli-bin
pkgver=0.3.0
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel CLI"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-cli' 'sckc')
conflicts=('sculk-cli-git')
source=("sckc-${pkgver}::${url}/releases/download/v${_releasever}/sckc-linux-amd64")
sha256sums=('ca22a91bef6409755d26ccb258aa62108ddfd9961e2d334c7a5fb3d4ddaeada4')

package() {
    install -Dm755 "${srcdir}/sckc-${pkgver}" "${pkgdir}/usr/bin/sckc"
}
