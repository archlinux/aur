# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-bin
pkgver=0.5.0
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel CLI"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('MIT' 'Apache-2.0')
provides=("sculk=${pkgver}" "sculk-cli=${pkgver}")
conflicts=('sculk' 'sculk-git' 'sculk-cli-bin' 'sculk-cli-git')
replaces=('sculk-cli-bin')
source=("sculk-${pkgver}::${url}/releases/download/v${_releasever}/sculk-linux-amd64")
sha256sums=('8fbaca42ee731b45047ce2d218152c43d2d9861ea0bc3fb095c0b758f936645c')

package() {
    install -Dm755 "${srcdir}/sculk-${pkgver}" "${pkgdir}/usr/bin/sculk"
}
