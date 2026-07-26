# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-cli-bin
pkgver=0.4.0
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel CLI"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('MIT' 'Apache-2.0')
provides=('sculk-cli' 'sckc')
conflicts=('sculk-cli-git')
source=("sckc-${pkgver}::${url}/releases/download/v${_releasever}/sckc-linux-amd64")
sha256sums=('61d1580cd35ed8d30bfcbf94ec45a935dbe770643105c68cfb409aa90a9a76dd')

package() {
    install -Dm755 "${srcdir}/sckc-${pkgver}" "${pkgdir}/usr/bin/sckc"
}
