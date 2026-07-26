# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-tui-bin
pkgver=0.4.0
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel TUI client"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('MIT' 'Apache-2.0')
provides=('sculk-tui' 'sckt')
conflicts=('sculk-tui-git')
source=("sckt-${pkgver}::${url}/releases/download/v${_releasever}/sckt-linux-amd64")
sha256sums=('a807992c2447c82d570a01ad03bcfcb2c26281f6d46154a40a7b61f3f9c023e8')

package() {
    install -Dm755 "${srcdir}/sckt-${pkgver}" "${pkgdir}/usr/bin/sckt"
}
