# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Keyboard-driven terminal password manager — encrypted, offline, no cloud"
arch=('x86_64')
url="https://github.com/jbgriesner/valt"
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')

source_x86_64=("valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c3d495bf1829492806e8f2e9a65295b1efa24dc26f6a53bb92f10010ca6c692c')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
