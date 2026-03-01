# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Keyboard-driven terminal password manager — encrypted, offline, no cloud'
arch=('x86_64')
url='https://github.com/jbgriesner/valt'
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')
source=("valt-${pkgver}-x86_64.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('18a1da6a876e5e9eb41394da42e0e1a02003e4618866b263ca32bf6deb389adf')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
