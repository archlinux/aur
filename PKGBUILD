# Maintainer: Guru <anjanaya@gmail.com>
pkgname=vex-tui-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A beautiful, fast, and feature-rich terminal-based Excel and CSV viewer"
arch=('x86_64')
url="https://github.com/CodeOne45/vex-tui"
license=('MIT')
provides=('vex-tui')
conflicts=('vex-tui')
source=("${url}/releases/download/v${pkgver}/vex-tui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1bdfcedc6835002a722ded1ac23e12b782d05e07990b8878e66edd7fb3d7dc12')

package() {
    install -Dm755 "${srcdir}/vex" "${pkgdir}/usr/bin/vex"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
