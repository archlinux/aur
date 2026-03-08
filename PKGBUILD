# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Keyboard-driven terminal password manager — encrypted, offline, no cloud"
arch=('x86_64')
url="https://github.com/jbgriesner/valt"
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')

source_x86_64=("valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e0cd845d33e88acc4d370219af1ac48eaea34cf1a1ee5b3393f857e33c6a8fd7')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
