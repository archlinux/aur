# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Keyboard-driven terminal password manager — encrypted, offline, no cloud"
arch=('x86_64')
url="https://github.com/jbgriesner/valt"
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')

source_x86_64=("valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('074c8e805fe64bf403e2222a729839824743f80aec4f2536b3e60700c8f1d66f')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
