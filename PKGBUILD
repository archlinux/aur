# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-tui-bin
pkgver=0.3.0
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel TUI client"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-tui' 'sckt')
conflicts=('sculk-tui-git')
source=("sckt-${pkgver}::${url}/releases/download/v${_releasever}/sckt-linux-amd64")
sha256sums=('aee81f7325089e456985c020ffcd021a0467d3733e13f32f0624c3e5c109b574')

package() {
    install -Dm755 "${srcdir}/sckt-${pkgver}" "${pkgdir}/usr/bin/sckt"
}
