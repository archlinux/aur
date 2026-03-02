# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='Keyboard-driven terminal password manager — encrypted, offline, no cloud'
arch=('x86_64')
url='https://github.com/jbgriesner/valt'
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')
source=("valt-${pkgver}-x86_64.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d3df56f42cd0e410ecd67ab8c47ce73851a8cd6b0d46a12cf3cd16a6979720ef')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
