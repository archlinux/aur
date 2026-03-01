# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Keyboard-driven terminal password manager — encrypted, offline, no cloud'
arch=('x86_64')
url='https://github.com/jbgriesner/valt'
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')
source=("valt-${pkgver}-x86_64.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('58aa26d3ca9ddcb5462e1cb53caf4267c19927ef62996588869445ed7d20af24')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
