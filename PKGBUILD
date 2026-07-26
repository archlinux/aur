# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=sculk-tui-bin
pkgver=0.3.1
pkgrel=1
_releasever=${pkgver//_/-}
pkgdesc="Minecraft P2P multiplayer tunnel TUI client"
arch=('x86_64')
url="https://github.com/KercyDing/sculk"
license=('GPL-3.0-only')
provides=('sculk-tui' 'sckt')
conflicts=('sculk-tui-git')
source=("sckt-${pkgver}::${url}/releases/download/v${_releasever}/sckt-linux-amd64")
sha256sums=('ed73ae0a9e2f540b96d4e3cb32df20f93cfcea047a705823d7bdfd4520952d9f')

package() {
    install -Dm755 "${srcdir}/sckt-${pkgver}" "${pkgdir}/usr/bin/sckt"
}
