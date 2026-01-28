# Maintainer: Guru <anjanaya@gmail.com>
pkgname=vex-tui-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="A beautiful, fast, and feature-rich terminal-based Excel and CSV viewer"
arch=('x86_64')
url="https://github.com/CodeOne45/vex-tui"
license=('MIT')
provides=('vex-tui')
conflicts=('vex-tui')
source=("${url}/releases/download/v${pkgver}/vex-tui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d83d411cd45b4081d170db6e77d38d46e3c341332fad3e59011167ebd2f50e41')

package() {
    install -Dm755 "${srcdir}/vex" "${pkgdir}/usr/bin/vex"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
