# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Keyboard-driven terminal password manager — encrypted, offline, no cloud'
arch=('x86_64')
url='https://github.com/jbgriesner/valt'
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')
source=("valt-${pkgver}-x86_64.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a5159b38e1a3e75fe5ec6f8843d77490812a8d659ed452b1c17e21a5c7030a81')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
