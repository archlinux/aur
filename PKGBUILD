# Maintainer: Guru <anjanaya@gmail.com>
pkgname=vex-tui-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A beautiful, fast, and feature-rich terminal-based Excel and CSV viewer"
arch=('x86_64')
url="https://github.com/CodeOne45/vex-tui"
license=('MIT')
provides=('vex-tui')
conflicts=('vex-tui')
source=("${url}/releases/download/v${pkgver}/vex-tui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('67110722936f7b69c182014dfcc3a00fc59594bd8d345dedf487505d5ecc46f3')

package() {
    install -Dm755 "${srcdir}/vex" "${pkgdir}/usr/bin/vex"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
