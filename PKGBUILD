# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-tui-bin
pkgver=0.3.0_rc.1
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel TUI client"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-tui' 'sckt')
conflicts=('sculk-tui-git')
source=("sckt-${pkgver}::${url}/releases/download/v${_releasever}/sckt-linux-amd64")
sha256sums=('f8a23b667603e2742c59e6a6c1bb4c86e501d66c18a80091245a6a4c71b1ff43')

package() {
    install -Dm755 "${srcdir}/sckt-${pkgver}" "${pkgdir}/usr/bin/sckt"
}
