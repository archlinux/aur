# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-tui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Minecraft P2P multiplayer tunnel TUI client"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-tui' 'sckt')
conflicts=('sculk-tui-git')
source=("sckt-${pkgver}::${url}/releases/download/v${pkgver}/sckt-linux-amd64")
sha256sums=('f2a6dce4d0d8cde91fb15822a6b048b3a1f4d0940f273b3b0b1b18f711ce2290')

package() {
    install -Dm755 "${srcdir}/sckt-${pkgver}" "${pkgdir}/usr/bin/sckt"
}
