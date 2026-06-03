# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-cli-bin
pkgver=0.3.0_rc.1
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel CLI"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-cli' 'sckc')
conflicts=('sculk-cli-git')
source=("sckc-${pkgver}::${url}/releases/download/v${_releasever}/sckc-linux-amd64")
sha256sums=('9fdc5d44ad00fd0f3b6284e923f259113227f41ab72f8616453f9223c95ff0a8')

package() {
    install -Dm755 "${srcdir}/sckc-${pkgver}" "${pkgdir}/usr/bin/sckc"
}
