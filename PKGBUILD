# Maintainer: Jenil
pkgname=arch-torification
pkgver=1.2
pkgrel=1
pkgdesc="A tool for full system torification of Arch Linux"
arch=('x86_64')
url="https://github.com/jenil1122/Arch-torification"
license=('GPL-3.0-only')
depends=('iptables')
source=("git+https://github.com/jenil1122/Arch-torification.git#branch=master")
sha256sums=("SKIP")
package() {
    cd "${srcdir}/Arch-torification" || return
    install -Dm755 arch-torification "${pkgdir}/usr/bin/arch-torification"
}
