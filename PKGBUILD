# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-cli-bin
pkgver=0.3.1
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel CLI"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-cli' 'sckc')
conflicts=('sculk-cli-git')
source=("sckc-${pkgver}::${url}/releases/download/v${_releasever}/sckc-linux-amd64")
sha256sums=('a6758a9a68b85dbe5781a2636527fbfb094010e4263d4d55bd7661a807a212b0')

package() {
    install -Dm755 "${srcdir}/sckc-${pkgver}" "${pkgdir}/usr/bin/sckc"
}
