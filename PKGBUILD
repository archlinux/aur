# Maintainer: Guru <anjanaya@gmail.com>
pkgname=vex-tui-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A beautiful, fast, and feature-rich terminal-based Excel and CSV viewer"
arch=('x86_64')
url="https://github.com/CodeOne45/vex-tui"
license=('MIT')
provides=('vex-tui')
conflicts=('vex-tui')
source=("${url}/releases/download/v${pkgver}/vex-tui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6ab22ba15d47e52f8b66ebd3211688b25fe4eb7d5176ecc6bee5540963657941')

package() {
    install -Dm755 "${srcdir}/vex" "${pkgdir}/usr/bin/vex"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
