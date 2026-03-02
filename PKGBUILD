# Maintainer: jbgriesner <https://github.com/jbgriesner>
pkgname=valt-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Keyboard-driven terminal password manager — encrypted, offline, no cloud'
arch=('x86_64')
url='https://github.com/jbgriesner/valt'
license=('GPL-3.0-or-later')
provides=('valt')
conflicts=('valt')
source=("valt-${pkgver}-x86_64.tar.gz::https://github.com/jbgriesner/valt/releases/download/v${pkgver}/valt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('82c591af26f7f02dfbf0c4363832d2bf4eec68c4d6dfd24d3bb698befb515508')

package() {
    install -Dm755 "${srcdir}/valt" "${pkgdir}/usr/bin/valt"
}
