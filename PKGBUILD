# Maintainer: Guru <anjanaya@gmail.com>
pkgname=vex-tui-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="A beautiful, fast, and feature-rich terminal-based Excel and CSV viewer"
arch=('x86_64')
url="https://github.com/CodeOne45/vex-tui"
license=('MIT')
provides=('vex-tui')
conflicts=('vex-tui')
source=("${url}/releases/download/v${pkgver}/vex-tui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c79bb2f5d18426372ef46bd5ecb23f8de74c50366a45da9cb4729d8946fcf819')

package() {
    install -Dm755 "${srcdir}/vex" "${pkgdir}/usr/bin/vex"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
